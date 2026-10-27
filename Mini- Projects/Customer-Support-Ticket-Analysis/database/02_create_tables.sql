USE customer_support_analysis;
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100) NOT NULL,
  customer_segment VARCHAR(30) NOT NULL
);
CREATE TABLE agents (
  agent_id INT PRIMARY KEY,
  agent_name VARCHAR(100) NOT NULL,
  support_team VARCHAR(50) NOT NULL
);
CREATE TABLE tickets (
  ticket_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  agent_id INT NULL,
  category VARCHAR(50) NOT NULL,
  priority VARCHAR(20) NOT NULL,
  channel VARCHAR(30) NOT NULL,
  status VARCHAR(20) NOT NULL,
  created_at DATETIME NOT NULL,
  first_response_at DATETIME NULL,
  resolved_at DATETIME NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (agent_id) REFERENCES agents(agent_id),
  CHECK (priority IN ('Low','Medium','High','Urgent')),
  CHECK (status IN ('Open','In Progress','Resolved','Closed')),
  CHECK (resolved_at IS NULL OR resolved_at >= created_at),
  CHECK (first_response_at IS NULL OR first_response_at >= created_at)
);
CREATE TABLE ticket_feedback (
  feedback_id INT PRIMARY KEY,
  ticket_id INT NOT NULL UNIQUE,
  satisfaction_score TINYINT NOT NULL,
  feedback_date DATE NOT NULL,
  FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id),
  CHECK (satisfaction_score BETWEEN 1 AND 5)
);

CREATE INDEX idx_tickets_created_at ON tickets(created_at);
CREATE INDEX idx_tickets_status_priority ON tickets(status, priority);
