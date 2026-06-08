<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="css/bootstrap.min.css" />
<title>新規登録</title>
</head>
<body>
 <div class="container py-5">
    <!-- Header -->
    <header class="text-center mb-5">
      <h1 class="display-5 fw-bold text-primary mb-2">Create New ToDo</h1>
      <p class="text-muted">新規登録画面</p>
    </header>

    <!-- Main Card -->
    <main class="row justify-content-center">
      <div class="col-lg-8 col-md-10">
        <div class="card shadow-sm border-0">
          <div class="card-body p-4">
            <h3 class="mb-4 fw-bold">ToDo 新規登録</h3>
            
<!--             methdoで送信、actionで送信先に設定している↓-->
            <form id="todoCreateForm" method="post" action="TodoCreate" novalidate>
              <!-- Title -->
              <div class="mb-3">
                <label for="todoTitle" class="form-label fw-bold small text-secondary">タイトル <span class="text-danger">*</span></label>
                <input type="text" class="form-control" id="todoTitle" required placeholder="ToDoのタイトルを入力してください" maxlength="100" name="title">
                <div class="invalid-feedback">タイトルは必須入力です</div>
              </div>

              <!-- Detail -->
              <div class="mb-3">
                <label for="todoDetail" class="form-label fw-bold small text-secondary">詳細</label>
                <textarea class="form-control" id="todoDetail" rows="4" placeholder="ToDoの詳細な内容を記入してください" name="detaile"></textarea>
              </div>

              <div class="row g-3 mb-4">
                <!-- Status -->
                <div class="col-md-6">
                  <label for="todoStatus" class="form-label fw-bold small text-secondary">ステータス</label>
                  <select class="form-select" id="todoStatus" name="status">
                    <option value="未着手" selected>未着手</option>
                    <option value="進行中">進行中</option>
                    <option value="完了">完了</option>
                  </select>
                </div>

                <!-- Due Date -->
                <div class="col-md-6">
                  <label for="todoDueDate" class="form-label fw-bold small text-secondary">期限日</label>
                  <input type="date" class="form-control" id="todoDueDate" name="due_date">
                </div>
              </div>

              <!-- Form Actions -->
              <div class="d-flex gap-3 justify-content-end border-top pt-4">
                <a href="TodoList" class="btn btn-outline-secondary d-inline-flex align-items-center gap-2">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                    <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
                  </svg>
                  キャンセル
                </a>
               
                <button type="submit" class="btn btn-primary d-inline-flex align-items-center gap-2">
                
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
                    <path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425z"/>
                  </svg>
                  登録
                  
                </button>
              </div>

            </form>
          </div>
        </div>
      </div>
    </main>

    <!-- Footer Info -->
    <footer class="text-center mt-5 text-muted small">
      <p>&copy; 2026 ToDo App Mockup. Created with Bootstrap 5.</p>
    </footer>
  </div>


<script src= "js/bootstrap.bundle.min.js"></script>

</body>
</html>