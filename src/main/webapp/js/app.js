// ToDo Application Mockup Engine

// Default mock data
const DEFAULT_TODOS = [
  { id: 1, title: 'ドキュメント作成', detail: '演習課題の設計書を作成する', status: '未着手', due_date: '2026-06-10' },
  { id: 2, title: 'コードレビュー', detail: 'サンプルプロジェクトのコードを確認する', status: '進行中', due_date: '2026-06-05' }
];

// Helper to get todos from localStorage
function getTodos() {
  const data = localStorage.getItem('mock_todos');
  if (!data) {
    localStorage.setItem('mock_todos', JSON.stringify(DEFAULT_TODOS));
    return DEFAULT_TODOS;
  }
  return JSON.parse(data);
}

// Helper to save todos to localStorage
function saveTodos(todos) {
  localStorage.setItem('mock_todos', JSON.stringify(todos));
}

// Render Todos in the list table
function renderTodos(filterKeyword = '', filterStatus = 'すべて') {
  const todoTableBody = document.getElementById('todoTableBody');
  if (!todoTableBody) return; // Not on the list page

  const todos = getTodos();
  todoTableBody.innerHTML = '';

  const filtered = todos.filter(todo => {
    const matchesKeyword = !filterKeyword || 
      todo.title.toLowerCase().includes(filterKeyword.toLowerCase()) || 
      (todo.detail && todo.detail.toLowerCase().includes(filterKeyword.toLowerCase()));
    
    const matchesStatus = filterStatus === 'すべて' || todo.status === filterStatus;
    
    return matchesKeyword && matchesStatus;
  });

  if (filtered.length === 0) {
    todoTableBody.innerHTML = `
      <tr>
        <td colspan="4" class="text-center py-4 text-muted">
          該当する ToDo が見つかりません。
        </td>
      </tr>
    `;
    return;
  }

  filtered.forEach(todo => {
    let statusClass = 'bg-secondary';
    if (todo.status === '進行中') statusClass = 'bg-warning text-dark';
    if (todo.status === '完了') statusClass = 'bg-success';

    const row = document.createElement('tr');
    row.innerHTML = `
      <td>${todo.id}</td>
      <td>
        <div class="fw-bold">${escapeHtml(todo.title)}</div>
        ${todo.detail ? `<div class="text-muted small mt-1">${escapeHtml(todo.detail)}</div>` : ''}
      </td>
      <td><span class="badge ${statusClass}">${escapeHtml(todo.status)}</span></td>
      <td>
        <span class="d-inline-flex align-items-center">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-event me-2 text-muted" viewBox="0 0 16 16">
            <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5z"/>
            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z"/>
          </svg>
          ${escapeHtml(todo.due_date || '-')}
        </span>
      </td>
    `;
    todoTableBody.appendChild(row);
  });
}

function escapeHtml(str) {
  if (!str) return '';
  return str.replace(/[&<>'"]/g, 
    tag => ({
      '&': '&amp;',
      '<': '&lt;',
      '>': '&gt;',
      "'": '&#39;',
      '"': '&quot;'
    }[tag] || tag)
  );
}

// Setup Event Listeners
document.addEventListener('DOMContentLoaded', () => {
  const isListPage = document.getElementById('todoTableBody');
  const isCreatePage = document.getElementById('todoCreateForm');

  if (isListPage) {
    // Initial Render
    renderTodos();

    // Event listener for search form
    const searchForm = document.getElementById('searchForm');
    const keywordInput = document.getElementById('keywordInput');
    const statusSelect = document.getElementById('statusSelect');

    const handleFilter = (e) => {
      if (e) e.preventDefault();
      const keyword = keywordInput.value.trim();
      const status = statusSelect.value;
      renderTodos(keyword, status);
    };

    searchForm.addEventListener('submit', handleFilter);
    keywordInput.addEventListener('input', handleFilter);
    statusSelect.addEventListener('change', handleFilter);

    // Reset button or reload mock data helper
    const resetMockBtn = document.getElementById('resetMockBtn');
    if (resetMockBtn) {
      resetMockBtn.addEventListener('click', () => {
        localStorage.removeItem('mock_todos');
        renderTodos();
      });
    }
  }

  if (isCreatePage) {
    isCreatePage.addEventListener('submit', (e) => {
      e.preventDefault();

      const title = document.getElementById('todoTitle').value.trim();
      const detail = document.getElementById('todoDetail').value.trim();
      const status = document.getElementById('todoStatus').value;
      const dueDate = document.getElementById('todoDueDate').value;

      if (!title) {
        alert('タイトルを入力してください。');
        return;
      }

      const todos = getTodos();
      const nextId = todos.length > 0 ? Math.max(...todos.map(t => t.id)) + 1 : 1;

      const newTodo = {
        id: nextId,
        title,
        detail,
        status,
        due_date: dueDate
      };

      todos.push(newTodo);
      saveTodos(todos);

      // Redirect with success flag
      window.location.href = 'todo_list.html?registered=true';
    });
  }

  // Handle Toast notification on redirect
  if (isListPage) {
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('registered')) {
      const toastEl = document.getElementById('successToast');
      if (toastEl) {
        if (window.bootstrap) {
          const toast = new bootstrap.Toast(toastEl, { delay: 3000 });
          toast.show();
        } else {
          toastEl.style.display = 'block';
          setTimeout(() => { toastEl.style.display = 'none'; }, 3000);
        }
        window.history.replaceState({}, document.title, window.location.pathname);
      }
    }
  }
});
