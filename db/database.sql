CREATE DATABASE IF NOT EXISTS qurilish_db;
USE qurilish_db;

-- 1. Foydalanuvchilar jadvali (RBAC tizimi uchun)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'manager', 'engineer', 'worker', 'accountant', 'inspector') NOT NULL DEFAULT 'worker',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Qurilish loyihalari jadvali
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    budget DECIMAL(15,2) NOT NULL,
    status ENUM('new', 'in_progress', 'completed', 'approved') DEFAULT 'new',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Ishchilar jadvali
CREATE TABLE workers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    position VARCHAR(100) NOT NULL,
    kpi_score DECIMAL(5,2) DEFAULT 0,
    salary DECIMAL(15,2) NOT NULL,
    project_id INT REFERENCES projects(id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Qurilish materiallari jadvali
CREATE TABLE materials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    supplier VARCHAR(255),
    project_id INT REFERENCES projects(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. Qurilish texnikalari jadvali
CREATE TABLE equipment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    gps_location VARCHAR(255),
    fuel_usage DECIMAL(10,2),
    status ENUM('available', 'in_use', 'maintenance') DEFAULT 'available',
    project_id INT REFERENCES projects(id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 6. Qurilish xavfsizligi (inspektorlar tekshiruvi)
CREATE TABLE safety_checks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    worker_id INT REFERENCES workers(id) ON DELETE CASCADE,
    check_date DATE NOT NULL,
    issue_found BOOLEAN DEFAULT FALSE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 7. Qurilish hujjatlari (shartnomalar, rejalar, smeta)
CREATE TABLE documents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT REFERENCES projects(id) ON DELETE CASCADE,
    doc_type VARCHAR(255) NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    uploaded_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 8. Moliyaviy boshqaruv va ish haqi
CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    worker_id INT REFERENCES workers(id) ON DELETE CASCADE,
    amount DECIMAL(15,2) NOT NULL,
    payment_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
