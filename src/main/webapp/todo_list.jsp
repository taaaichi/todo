<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="css/bootstrap.min.css" />
<title>一覧画面だおおおおおおおおおおおんんんん</title>
</head>
<body>

<div class="container py-5">
    <!-- Header -->
    <header class="text-center mb-5">
      <h1 class="display-5 fw-bold text-primary mb-2">ToDo List Manager</h1>
      <p class="text-muted">一覧画面</p>
    </header>

    <!-- Main Card -->
    <main class="card shadow-sm border-0 mb-4">
      <div class="card-body p-4">
        
        <!-- Actions Bar (Search & Create) -->
        <div class="row g-3 align-items-end mb-4">
          <!-- Search Form -->
          <div class="col-lg-8">
            <form id="searchForm" class="row g-2">
              <div class="col-md-5">
                <label for="keywordInput" class="form-label small fw-bold text-secondary">キーワード</label>
                <input type="text" class="form-control" id="keywordInput" placeholder="タイトルまたは詳細で検索...">
              </div>
              <div class="col-md-4">
                <label for="statusSelect" class="form-label small fw-bold text-secondary">ステータス</label>
                <select class="form-select" id="statusSelect">
                  <option value="すべて">すべて</option>
                  <option value="未着手">未着手</option>
                  <option value="進行中">進行中</option>
                  <option value="完了">完了</option>
                </select>
              </div>
              <div class="col-md-3 d-flex align-items-end">
                <button type="submit" class="btn btn-outline-primary w-100 d-inline-flex align-items-center justify-content-center gap-2">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                  </svg>
                  検索
                </button>
              </div>
            </form>
          </div>

          <!-- Add Button -->
          <div class="col-lg-4 text-lg-end">
            <div class="d-flex gap-2 justify-content-lg-end justify-content-start">
              <button id="resetMockBtn" class="btn btn-outline-secondary" title="データを初期状態に戻す">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-counterclockwise" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2z"/>
                  <path d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466"/>
                </svg>
              </button>
              <a href="TodoCreate" class="btn btn-primary d-inline-flex align-items-center gap-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2"/>
                </svg>
                新規追加
              </a>
            </div>
          </div>
        </div>

        <!-- ToDo List Table -->
        <div class="table-responsive">
          <table class="table table-striped table-hover align-middle">
            <thead class="table-light">
              <tr>
                <th style="width: 10%;">#</th>
                <th style="width: 50%;">タイトル</th>
                <th style="width: 20%;">ステータス</th>
                <th style="width: 20%;">期限日</th>
              </tr>
            </thead>
            <tbody id="todoTableBody">
            
            <c:forEach var= "tds" items = "${todos}">
    <tr>
      <th scope="row"><c:out value= "${tds.todo_id}" /></th>
      <td><c:out value= "${tds.title}" /></td>
      <td><c:out value= "${tds.detail}" /></td>
      <td><c:out value= "${tds.status}" /></td>
      <td><c:out value= "${tds.due_date}" /></td>
    </tr>
    </c:forEach>
    
    
              <!-- Dynamic elements render here via JS -->
              <tr>
                <td colspan="4" class="text-center py-4 text-muted">
                  読み込み中...
                </td>
              </tr>
            </tbody>
          </table>
        </div>

      </div>
    </main>

    <!-- Footer Info -->
    <footer class="text-center mt-5 text-muted small">
      <p>&copy; 2026 ToDo App Mockup. Created with Bootstrap 5.</p>
    </footer>
  </div>

  <!-- Success Toast -->
  <div class="toast-container-custom">
    <div id="successToast" class="toast align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
      <div class="d-flex">
        <div class="toast-body">
          ToDoが正常に登録されました！
        </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
    </div>
  </div>


<script src= "js/bootstrap.bundle.min.js"></script>
</body>
</html>