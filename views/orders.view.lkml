# The name of this view in Looker is "Orders"
view: orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `demo_dbt_jaffle.orders` ;;
  drill_fields: [order_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Count Drink Items" in Explore.

  dimension: count_drink_items {
    type: number
    sql: ${TABLE}.count_drink_items ;;
  }

  dimension: count_food_items {
    type: number
    sql: ${TABLE}.count_food_items ;;
  }

  dimension: count_order_items {
    type: number
    sql: ${TABLE}.count_order_items ;;
  }

  dimension: customer_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_order_number {
    type: number
    sql: ${TABLE}.customer_order_number ;;
  }

  dimension: is_drink_order {
    type: yesno
    sql: ${TABLE}.is_drink_order ;;
  }

  dimension: is_food_order {
    type: yesno
    sql: ${TABLE}.is_food_order ;;
  }

  dimension: location_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.location_id ;;
  }

  dimension: order_cost {
    type: number
    sql: ${TABLE}.order_cost ;;
  }

  dimension: order_items_subtotal {
    type: number
    sql: ${TABLE}.order_items_subtotal ;;
  }

  dimension: order_total {
    type: number
    sql: ${TABLE}.order_total ;;
  }

  dimension: order_total_cents {
    type: number
    sql: ${TABLE}.order_total_cents ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: ordered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ordered_at ;;
  }

  dimension: subtotal {
    type: number
    sql: ${TABLE}.subtotal ;;
  }

  dimension: subtotal_cents {
    type: number
    sql: ${TABLE}.subtotal_cents ;;
  }

  dimension: tax_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.tax_paid ;;
  }

  dimension: tax_paid_cents {
    type: number
    sql: ${TABLE}.tax_paid_cents ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	order_id,
	locations.location_name,
	locations.location_id,
	customers.customer_name,
	customers.customer_id,
	order_items.count,
	stg_order_items.count,
	raw_payments.count,
	stg_payments.count
	]
  }

}
