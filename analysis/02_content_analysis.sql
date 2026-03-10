模块二：内容消费行为分析

USE content_platform;

- 各分类完播率与互动率
SELECT
    v.category,
    ROUND(AVG(a.watch_sec / v.duration_sec), 2) AS avg_completion_rate,
    ROUND(SUM(CASE WHEN a.is_liked=1 OR a.is_commented=1 OR a.is_shared=1
                   THEN 1 ELSE 0 END) / COUNT(*), 2) AS interaction_rate
FROM user_actions a
LEFT JOIN videos v ON a.video_id = v.video_id
GROUP BY v.category
ORDER BY avg_completion_rate DESC;
