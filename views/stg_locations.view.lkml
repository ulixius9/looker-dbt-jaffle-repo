# The name of this view in Looker is "Stg Locations"
view: stg_locations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `demo_dbt_jaffle.stg_locations` ;;
  drill_fields: [location_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: location_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.location_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Location Name" in Explore.

  dimension: location_name {
    type: string
    sql: ${TABLE}.location_name ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: opened {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.opened_date ;;
  }

  dimension: tax_rate {
    type: number
    sql: ${TABLE}.tax_rate ;;
  }
  measure: count {
    type: count
    drill_fields: [location_id, location_name]
  }
}
