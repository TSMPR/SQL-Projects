USE customer_support_analysis;
-- Rank agents by completed tickets
WITH agent_summary AS (
 SELECT a.agent_id,a.agent_name,
 SUM(t.status IN ('Resolved','Closed')) AS completed_tickets
 FROM agents a LEFT JOIN tickets t ON a.agent_id=t.agent_id
 GROUP BY a.agent_id,a.agent_name
)
SELECT agent_name,completed_tickets,
 DENSE_RANK() OVER (ORDER BY completed_tickets DESC) AS completion_rank
FROM agent_summary ORDER BY completion_rank,agent_name;
-- Month-over-month ticket volume
WITH monthly AS (
 SELECT DATE_FORMAT(created_at,'%Y-%m') AS ticket_month,COUNT(*) AS ticket_count
 FROM tickets GROUP BY DATE_FORMAT(created_at,'%Y-%m')
), comparison AS (
 SELECT ticket_month,ticket_count,
 LAG(ticket_count) OVER (ORDER BY ticket_month) AS previous_month_count
 FROM monthly
)
SELECT ticket_month,ticket_count,previous_month_count,
 ticket_count-previous_month_count AS change_from_previous_month,
 CASE WHEN previous_month_count IS NULL THEN 'First month'
      WHEN ticket_count>previous_month_count THEN 'Increased'
      WHEN ticket_count<previous_month_count THEN 'Decreased'
      ELSE 'No change' END AS trend
FROM comparison ORDER BY ticket_month;
-- Tickets taking longer than average to resolve
WITH resolved AS (
 SELECT ticket_id,category,priority,
 TIMESTAMPDIFF(MINUTE,created_at,resolved_at) AS resolution_minutes
 FROM tickets WHERE resolved_at IS NOT NULL
)
SELECT ticket_id,category,priority,ROUND(resolution_minutes/60,2) AS resolution_hours
FROM resolved
WHERE resolution_minutes>(SELECT AVG(resolution_minutes) FROM resolved)
ORDER BY resolution_minutes DESC;
-- Complete ticket detail with customer, agent, and optional feedback
SELECT t.ticket_id,c.customer_name,t.category,t.priority,t.status,a.agent_name,f.satisfaction_score
FROM tickets t JOIN customers c ON t.customer_id=c.customer_id
LEFT JOIN agents a ON t.agent_id=a.agent_id
LEFT JOIN ticket_feedback f ON t.ticket_id=f.ticket_id
ORDER BY t.created_at;
