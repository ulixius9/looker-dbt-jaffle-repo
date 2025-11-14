# The name of this view in Looker is "Stg Products"
view: stg_products {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `demo_dbt_jaffle.stg_products` ;;
  drill_fields: [product_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: product_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.product_id ;;
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

  dimension: product_description {
    type: string
    sql: ${TABLE}.product_description ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_price {
    type: number
    sql: ${TABLE}.product_price ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }
  measure: count {
    type: count
    drill_fields: [product_id, product_name]
  }
}
