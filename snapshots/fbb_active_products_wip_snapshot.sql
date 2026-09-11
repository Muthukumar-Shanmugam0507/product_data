{% snapshot snapshot_fbb_active_products_wip %}

{{
    config(
        target_database='DS_PROJECTS',
        target_schema='PRODUCT_DATA_MANAGEMENT_WIP',
        unique_key='HASH_KEY',
        strategy='check',
        check_cols=['HASH_KEY'],
        invalidate_hard_deletes=True
    )
}}

select * from {{ ref('fbb_daily_active_products') }}

{% endsnapshot %}