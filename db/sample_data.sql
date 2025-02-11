USE qurilish_db;

-- Foydalanuvchilarni qo‘shish
INSERT INTO users (full_name, username, password, role) VALUES
('Admin User', 'admin', MD5('admin123'), 'admin'),
('Project Manager', 'manager', MD5('manager123'), 'manager'),
('Muhandis Aliyev', 'engineer1', MD5('engineer123'), 'engineer'),
('Ishchi Vohidov', 'worker1', MD5('worker123'), 'worker');

-- Qurilish loyihalarini qo‘shish
INSERT INTO projects (name, description, start_date, end_date, budget, status) VALUES
('Turar Joy Kompleksi', 'Yangi turar joy binolari qurilishi', '2025-01-01', '2025-12-31', 5000000, 'new'),
('Ko‘prik Qurilishi', 'Yirik yo‘l infratuzilmasi qurilishi', '2025-02-15', '2026-06-30', 8000000, 'in_progress');

-- Ishchilarni qo‘shish
INSERT INTO workers (full_name, position, kpi_score, salary, project_id) VALUES
('Aliyev Bekzod', 'Mason', 87.5, 1500, 1),
('Sobirov Jamshid', 'Prorab', 92.0, 2500, 2);

-- Qurilish materiallarini qo‘shish
INSERT INTO materials (name, quantity, price, supplier, project_id) VALUES
('Tsement', 100, 15.50, 'Toshkent Materiallar Zavodi', 1),
('G‘isht', 5000, 0.30, 'Buxoro G‘isht Zavodi', 2);

-- Qurilish texnikalarini qo‘shish
INSERT INTO equipment (type, gps_location, fuel_usage, status, project_id) VALUES
('Ekskavator', '41.2995, 69.2401', 12.5, 'in_use', 1),
('Beton aralashtirgich', '40.9783, 71.6075', 5.3, 'available', 2);

-- Qurilish xavfsizlik tekshiruvlari
INSERT INTO safety_checks (worker_id, check_date, issue_found, description) VALUES
(1, '2025-04-10', FALSE, 'Xavfsizlik me’yorlariga mos');

-- Qurilish hujjatlari
INSERT INTO documents (project_id, doc_type, file_path) VALUES
(1, 'Loyiha Chizmasi', 'uploads/loyiha1.pdf'),
(2, 'Smeta Hisoboti', 'uploads/smeta2.xlsx');

-- Ish haqi to‘lovlari
INSERT INTO payments (worker_id, amount, payment_date) VALUES
(1, 1500, '2025-03-01'),
(2, 2500, '2025-03-01');
