<?php

class AdminDanhMuc
{
    public $conn;

    public function __construct()
    {
        $this->conn = connectDB();
    }

    public function getAllDanhMuc()
    {
        try {
            $sql = "SELECT * FROM categories";

            $stmt = $this->conn->prepare($sql);

            $stmt->execute();

            return $stmt->fetchAll();
        } catch (Exception $e) {
            echo "Lỗi" . $e->getMessage();
        }
    }

    public function insertDanhMuc($name, $Description)
    {
        try {
            $sql = "INSERT INTO `categories` ( `name`, `Description`) VALUES (`:name`,`:Description`)";

            $stmt = $this->conn->prepare($sql);

            $stmt->execute([
                ":name" => $name,
                ":Description" => $Description
            ]);

            return true;
        } catch (Exception $e) {
            echo "Lỗi" . $e->getMessage();
        }
    }

    public function getDetailDanhMuc($id)
    {
        try {
            $sql = "SELECT * FROM categories WHERE id = :id";

            $stmt = $this->conn->prepare($sql);

            $stmt->execute([
                ":id" => $id,
            ]);

            return $stmt->fetch();
        } catch (Exception $e) {
            echo "Lỗi" . $e->getMessage();
        }
    }

    public function updateDanhMuc($id, $name, $Description)
    {
        try {
            $sql = "UPDATE categories SET name = :name, Description = :Description WHERE id = :id";

            $stmt = $this->conn->prepare($sql);

            $stmt->execute([
                ":name" => $name,
                ":Description" => $Description,
                ":id" => $id
            ]);

            return true;
        } catch (Exception $e) {
            echo "Lỗi" . $e->getMessage();
        }
    }

    public function destroyDanhMuc($id)
    {
        try {
            $sql = "DELETE FROM categories WHERE id = :id";

            $stmt = $this->conn->prepare($sql);

            $stmt->execute([
                ":id" => $id
            ]);

            return true;
        } catch (Exception $e) {
            echo "Lỗi" . $e->getMessage();
        }
    }
}
