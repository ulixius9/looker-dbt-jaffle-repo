# The name of this view in Looker is "Stg Order Items"
view: stg_order_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `demo_dbt_jaffle.stg_order_items` ;;
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
    # This dimension will be called "Order ID" in Explore.

  dimension: order_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }
  measure: count {
    type: count
    drill_fields: [order_item_id, products.product_id, products.product_name, orders.order_id]
  }
}
