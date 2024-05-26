{#
    This macro returns the description of the payment_type 
#}

{% macro get_payment_type_description(payment_type) -%}

    case  
        when cast(replace({{ payment_type }}, '.0', '') as integer) = 1 then 'Credit card'
        when cast(replace({{ payment_type }}, '.0', '') as integer) = 2 then 'Cash'
        when cast(replace({{ payment_type }}, '.0', '') as integer) = 3 then 'No charge'
        when cast(replace({{ payment_type }}, '.0', '') as integer) = 4 then 'Dispute'
        when cast(replace({{ payment_type }}, '.0', '') as integer) = 5 then 'Unknown'
        when cast(replace({{ payment_type }}, '.0', '') as integer) = 6 then 'Voided trip'
        else 'EMPTY'
    end

{%- endmacro %}