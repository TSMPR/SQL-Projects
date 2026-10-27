USE customer_support_analysis;
-- Resolution duration for completed tickets
SELECT ticket_id, category, priority, status,
 ROUND(TIMESTAMPDIFF(MINUTE,created_at,resolved_at)/60,2) AS resolution_hours
FROM tickets WHERE resolved_at IS NOT NULL ORDER BY resolution_hours DESC;
-- Average resolution time by priority
SELECT priority, COUNT(*) AS completed_tickets,
 ROUND(AVG(TIMESTAMPDIFF(MINUTE,created_at,resolved_at))/60,2) AS avg_resolution_hours
FROM tickets WHERE resolved_at IS NOT NULL GROUP BY priority ORDER BY avg_resolution_hours DESC;
-- First response time in minutes
SELECT ticket_id, channel,
 ROUND(TIMESTAMPDIFF(SECOND,created_at,first_response_at)/60,2) AS first_response_minutes
FROM tickets WHERE first_response_at IS NOT NULL ORDER BY first_response_minutes DESC;
-- Unresolved backlog by category
SELECT category, COUNT(*) AS unresolved_tickets FROM tickets
WHERE status IN ('Open','In Progress') GROUP BY category ORDER BY unresolved_tickets DESC;
-- Urgent unresolved tickets
SELECT ticket_id, category, status, created_at FROM tickets
WHERE priority='Urgent' AND status IN ('Open','In Progress') ORDER BY created_at;
