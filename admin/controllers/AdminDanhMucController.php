<?php

class AdminDanhMucController
{

    public $modelDanhMuc;

    public function __construct() 
    {
        $this->modelDanhMuc = new AdminDanhMuc();
    }

    public function danhSachDanhMuc()
    {
        $listDanhMuc = $this->modelDanhMuc->getAllDanhMuc();

        require_once './views/danhmuc/listDanhMuc.php';
    }

    public function formAddDanhMuc()
    {
        // Hàm này dùng để hiển thị form nhập
        require_once './views/danhmuc/addDanhMuc.php';
    }

    public function postAddDanhMuc()
    {
        // Hàm này dùng để xử lý thêm dữ liệu

        // Kiểm tra xem dữ liệu có phải đc submit lên ko
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            // Lấy ra dữ liệu
            $name = $_POST['ten_danh_muc'];
            $Description = $_POST['mo_ta'];

            // Tạo mảng trống để chứa dữ liệu
            $errors = [];
            if (empty($name)) {
                $errors['ten_danh_muc'] = 'Tên danh mục không được bỏ trống';
            }

            // Nếu ko có lỗi thì tiến hành thêm danh mục
            if (empty($errors)) {
                // Nếu ko có lỗi thì tiến hành thêm danh mục
                $this->modelDanhMuc->insertDanhMuc($name, $Description);

                header("Location: " . BASE_URL_ADMIN . '?act=danh-muc');
                exit();
            } else {
                // Trả về form và lỗi
                require_once './views/danhmuc/addDanhMuc.php';
            }
        }
    }

    public function formEditDanhMuc()
    {
        // Hàm này dùng để hiển thị form nhập
        // Lấy ra thông tin của danh mục cần sửa
        $id = $_GET['id_danh_muc'];
        $danhMuc = $this->modelDanhMuc->getDetailDanhMuc($id);
        if ($danhMuc) {
            require_once './views/danhmuc/editDanhMuc.php';
        } else {
            header("Location: " . BASE_URL_ADMIN . '?act=danh-muc');
            exit();
        }
    }

    public function postEditDanhMuc()
    {
        // Hàm này dùng để xử lý thêm dữ liệu

        // Kiểm tra xem dữ liệu có phải đc submit lên ko
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            // Lấy ra dữ liệu
            $id = $_POST['id'];
            $name = $_POST['name'];
            $Description = $_POST['Description'];

            // Tạo 1 mảng trống để chứa dữ liệu
            $errors = [];
            if (empty($name)) {
                $errors['name'] = 'Tên danh mục không được bỏ trống';
            }

            // Nếu ko có lỗi thì tiến hành sửa danh mục
            if (empty($errors)) {
                // Nếu ko có lỗi thì tiến hành sửa danh mục
                $this->modelDanhMuc->updateDanhMuc($id, $name, $Description);

                header("Location: " . BASE_URL_ADMIN . '?act=danh-muc');
                exit();
            } else {
                // Trả về form và lỗi
                $danhMuc = ['id' => $id, 'name' => $name, 'Description' => $Description];
                require_once './views/danhmuc/editDanhMuc.php';
            }
        }
    }

    public function deleteDanhMuc()
    {
        $id = $_GET['id_danh_muc'];
        $danhMuc = $this->modelDanhMuc->getDetailDanhMuc($id);

        if ($danhMuc) {
            $this->modelDanhMuc->destroyDanhMuc($id);
        }

        header("Location: " . BASE_URL_ADMIN . '?act=danh-muc');
        exit();
    }
} 
