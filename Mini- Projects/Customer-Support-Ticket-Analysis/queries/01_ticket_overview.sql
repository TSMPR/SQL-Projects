USE customer_support_analysis;
-- Overall ticket KPIs
SELECT COUNT(*) AS total_tickets,
 SUM(status='Open') AS open_tickets,
 SUM(status='In Progress') AS in_progress_tickets,
 SUM(status IN ('Resolved','Closed')) AS completed_tickets
FROM tickets;
-- Volume by status and priority
SELECT status, priority, COUNT(*) AS ticket_count
FROM tickets GROUP BY status, priority ORDER BY ticket_count DESC;
-- Volume by category and channel
SELECT category, COUNT(*) AS ticket_count FROM tickets
GROUP BY category ORDER BY ticket_count DESC;
SELECT channel, COUNT(*) AS ticket_count FROM tickets
GROUP BY channel ORDER BY ticket_count DESC;
-- Monthly ticket volume
SELECT DATE_FORMAT(created_at,'%Y-%m') AS ticket_month, COUNT(*) AS tickets_created
FROM tickets GROUP BY DATE_FORMAT(created_at,'%Y-%m') ORDER BY ticket_month;
