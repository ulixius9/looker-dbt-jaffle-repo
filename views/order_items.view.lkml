# The name of this view in Looker is "Order Items"
view: order_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `demo_dbt_jaffle.order_items` ;;
  drill_fields: [order_item_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: order_item_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.order_item_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Is Drink Item" in Explore.

  dimension: is_drink_item {
    type: yesno
    sql: ${TABLE}.is_drink_item ;;
  }

  dimension: is_food_item {
    type: yesno
    sql: ${TABLE}.is_food_item ;;
  }

  dimension: order_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: ordered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ordered_at ;;
  }

  dimension: product_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_price {
    type: number
    sql: ${TABLE}.product_price ;;
  }

  dimension: supply_cost {
    type: number
    sql: ${TABLE}.supply_cost ;;
  }
  measure: count {
    type: count
    drill_fields: [order_item_id, product_name, products.product_id, products.product_name, orders.order_id]
  }
}
