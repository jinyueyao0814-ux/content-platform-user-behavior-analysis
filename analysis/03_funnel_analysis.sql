模块三：旅游产品转化漏斗分析

USE content_platform;

各步骤用户数及转化率
SELECT
    event_type,
    user_count,
    step_order,
    LAG(user_count, 1) OVER (ORDER BY step_order) AS prev_step_count,
    ROUND(user_count / LAG(user_count, 1) OVER (ORDER BY step_order), 2) AS conversion_rate
FROM (
    SELECT
        event_type,
        COUNT(DISTINCT user_id) AS user_count,
        CASE WHEN event_type = 'view_product' THEN 1
             WHEN event_type = 'add_to_cart' THEN 2
             WHEN event_type = 'start_checkout' THEN 3
             WHEN event_type = 'paid' THEN 4
        END AS step_order
    FROM funnel_events
    GROUP BY event_type
) t
ORDER BY step_order;
