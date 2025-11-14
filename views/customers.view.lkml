# The name of this view in Looker is "Customers"
view: customers {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `demo_dbt_jaffle.customers` ;;
  drill_fields: [customer_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: customer_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.customer_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Count Lifetime Orders" in Explore.

  dimension: count_lifetime_orders {
    type: number
    sql: ${TABLE}.count_lifetime_orders ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: customer_type {
    type: string
    sql: ${TABLE}.customer_type ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: first_ordered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_ordered_at ;;
  }

  dimension_group: last_ordered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_ordered_at ;;
  }

  dimension: lifetime_spend {
    type: number
    sql: ${TABLE}.lifetime_spend ;;
  }

  dimension: lifetime_spend_pretax {
    type: number
    sql: ${TABLE}.lifetime_spend_pretax ;;
  }

  dimension: lifetime_tax_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.lifetime_tax_paid ;;
  }
  measure: count {
    type: count
    drill_fields: [customer_id, customer_name, orders.count, stg_orders.count]
  }
}
