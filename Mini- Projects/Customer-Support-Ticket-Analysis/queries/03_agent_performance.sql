USE customer_support_analysis;
-- Agent workload and completed tickets
SELECT a.agent_name, a.support_team, COUNT(t.ticket_id) AS assigned_tickets,
 SUM(t.status IN ('Resolved','Closed')) AS completed_tickets,
 SUM(t.status IN ('Open','In Progress')) AS active_tickets
FROM agents a LEFT JOIN tickets t ON a.agent_id=t.agent_id
GROUP BY a.agent_id,a.agent_name,a.support_team ORDER BY completed_tickets DESC;
-- Resolution time and feedback by agent
SELECT a.agent_name,
 COUNT(DISTINCT t.ticket_id) AS resolved_tickets,
 ROUND(AVG(TIMESTAMPDIFF(MINUTE,t.created_at,t.resolved_at))/60,2) AS avg_resolution_hours,
 ROUND(AVG(f.satisfaction_score),2) AS avg_satisfaction,
 COUNT(f.feedback_id) AS feedback_responses
FROM agents a
LEFT JOIN tickets t ON a.agent_id=t.agent_id AND t.resolved_at IS NOT NULL
LEFT JOIN ticket_feedback f ON t.ticket_id=f.ticket_id
GROUP BY a.agent_id,a.agent_name ORDER BY avg_satisfaction DESC;
-- Customer satisfaction by category
SELECT t.category, COUNT(f.feedback_id) AS responses,
 ROUND(AVG(f.satisfaction_score),2) AS avg_satisfaction
FROM tickets t JOIN ticket_feedback f ON t.ticket_id=f.ticket_id
GROUP BY t.category ORDER BY avg_satisfaction DESC;
-- Agents assigned more than four tickets
SELECT a.agent_name, COUNT(t.ticket_id) AS assigned_tickets
FROM agents a JOIN tickets t ON a.agent_id=t.agent_id
GROUP BY a.agent_id,a.agent_name HAVING COUNT(t.ticket_id)>4;
