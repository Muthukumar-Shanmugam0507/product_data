with dummy_taxonomy as (
    select
        cast(null as varchar) as DIVISION,
        cast(null as varchar) as CATEGORY,
        cast(null as varchar) as SUBCATEGORY,
        cast(null as number) as PRODUCT_ID
    where 1 = 0
)

select
    ap.BRAND_ID
    , ap.BRAND_CODE
    , ap.PRODUCT_ID
    , ap.MF_MASTER_ITEM_ID
    , ap.MF_ID
    , ap.TITLE
    , ap.MS_DESCRIPTION
    , ap.PCM_BRAND
    , ap.PCM_SEO_DESCRIPTION
    , ap.CUSTOMER_REVIEW_COUNT
    , ap.CUSTOMER_REVIEW_AVERAGE
    , ap.IMAGE_URL
    , ( {{ get_product_url('ap.PRODUCT_ID', 'ap.BRAND_CODE') }} ) as PRODUCT_URL
    -- Temporary placeholders
    , cast(null as varchar) as DIVISION
    , cast(null as varchar) as CATEGORY
    , cast(null as varchar) as SUBCATEGORY
    , ({{ get_active_products_key() }}) as HASH_KEY
from
    {{ ref('int_active_products_wip') }} as ap