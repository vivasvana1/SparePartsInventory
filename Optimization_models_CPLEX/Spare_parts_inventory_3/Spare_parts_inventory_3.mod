/*********************************************************************
 * OPL 22.1.1.0 Model – Final Business-Level Inventory Optimization
 * Author: Priya
 * Created: 03-Jul-2025
 *
 * Objective:
 *   Minimize total inventory cost (holding + ordering + stockout)
 *   Enforce ABC-class service level targets
 *   Stay within regional inventory budgets
 *********************************************************************/

// =======================
// SETS & INPUT PARAMETERS
// =======================

{string} SKUs = ...;
{string} Regions = ...;

float unit_cost[SKUs] = ...;
float original_holding_cost[SKUs] = ...;
float original_ordering_cost[SKUs] = ...;
float original_stockout_cost[SKUs] = ...;
float original_avg_inventory[SKUs] = ...;
float original_service_level[SKUs] = ...;

string ABC_Class[SKUs] = ...;
string sku_to_region[SKUs] = ...;

float regional_inventory_budget[Regions] = ...;

// =============================
// DERIVED PARAMETERS (Targets)
// =============================

// Pre-calculate the service level target for each SKU before the solve.
float service_level_target[SKUs];

execute {
  for (var s in SKUs) {
    if (ABC_Class[s] == "A") {
      service_level_target[s] = 0.98;
    } else if (ABC_Class[s] == "B") {
      service_level_target[s] = 0.95;
    } else {
      service_level_target[s] = 0.90;
    }
  }
}

// =======================
// DECISION VARIABLES
// =======================

dvar float+ order_qty_factor[SKUs] in 0.7..1.5;
dvar float+ inventory_efficiency_factor[SKUs] in 0.8..1.2;

dvar float+ optimized_avg_inventory[SKUs];
dvar float+ optimized_holding_cost[SKUs];
dvar float+ optimized_ordering_cost[SKUs];
dvar float+ optimized_stockout_cost[SKUs];
dvar float+ optimized_total_cost[SKUs];
dvar float+ optimized_service_level[SKUs] in 0..1;

// =======================
// OBJECTIVE FUNCTION
// =======================

minimize
  sum(s in SKUs) optimized_total_cost[s];

// =======================
// CONSTRAINTS
// =======================

subject to {

  // 1. Define optimization calculations
  // CORRECTED: Use '==' for all constraint definitions.
  forall(s in SKUs) {
    optimized_avg_inventory[s] == original_avg_inventory[s] * inventory_efficiency_factor[s];
    optimized_holding_cost[s] == original_holding_cost[s] * inventory_efficiency_factor[s];
    optimized_ordering_cost[s] == original_ordering_cost[s] * order_qty_factor[s];
    optimized_stockout_cost[s] == original_stockout_cost[s] * (2.0 - inventory_efficiency_factor[s]);
    optimized_total_cost[s] == optimized_holding_cost[s] + optimized_ordering_cost[s] + optimized_stockout_cost[s];
    optimized_service_level[s] == original_service_level[s] + (0.05 / 0.4) * (inventory_efficiency_factor[s] - 0.8);
  }

  // 2. Service level requirement
  forall(s in SKUs)
    optimized_service_level[s] >= service_level_target[s];

  // 3. Regional inventory budget limits
  // CORRECTED: Use standard OPL filtering syntax for better readability and performance.
  forall(r in Regions)
    sum(s in SKUs : sku_to_region[s] == r)
      (optimized_avg_inventory[s] * unit_cost[s])
    <= regional_inventory_budget[r];
}

// =======================
// EXPORT RESULTS TO CSV
// =======================

execute {
  var f = new IloOplOutputFile("spare_parts_inventory3.csv");
  f.writeln("SKU,ABC_Class,inventory_efficiency_factor,order_qty_factor,original_service_level,optimized_service_level,original_holding_cost,optimized_holding_cost,original_ordering_cost,optimized_ordering_cost,original_stockout_cost,optimized_stockout_cost,original_total_cost,optimized_total_cost,original_avg_inventory,optimized_avg_inventory,cost_savings_pct");

  for (var s in SKUs) {
    var original_total = original_holding_cost[s] + original_ordering_cost[s] + original_stockout_cost[s];
    var savings = original_total - optimized_total_cost[s];
    var savings_pct = (original_total > 0) ? (savings / original_total) * 100 : 0;

    f.writeln(
      s + "," + ABC_Class[s] + "," +
      inventory_efficiency_factor[s] + "," + order_qty_factor[s] + "," +
      original_service_level[s] + "," + optimized_service_level[s] + "," +
      original_holding_cost[s] + "," + optimized_holding_cost[s] + "," +
      original_ordering_cost[s] + "," + optimized_ordering_cost[s] + "," +
      original_stockout_cost[s] + "," + optimized_stockout_cost[s] + "," +
      original_total + "," + optimized_total_cost[s] + "," +
      original_avg_inventory[s] + "," + optimized_avg_inventory[s] + "," +
      savings_pct
    );
  }
  f.close();
  writeln("spare_parts_inventory3.csv");
}
