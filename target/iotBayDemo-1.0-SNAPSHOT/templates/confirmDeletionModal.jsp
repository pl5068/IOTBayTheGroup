<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="true" %>

<dialog id="confirm-delete-modal">
  <div class="fixed flex h-full w-full items-center justify-center">
    <div
      class="max-w-lg overflow-hidden rounded-lg border-gray-300 bg-white shadow-xl"
    >
      <div class="flex gap-4 p-6">
        <div
          class="flex h-10 w-10 flex-shrink-0 items-center justify-center rounded-full bg-red-100 text-red-600"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            class="h-5 w-5"
          >
            <path
              d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3"
            />
            <path d="M12 9v4" />
            <path d="M12 17h.01" />
          </svg>
        </div>
        <div class="flex flex-col gap-2">
          <h1 class="text-base font-semibold text-gray-900">Delete Item</h1>
          <p class="text-sm text-gray-500">
            Are you sure you want to delete
            <span id="confirm-delete-modal-item"></span> from the catalogue?
            This action cannot be undone.
          </p>
        </div>
      </div>
      <div class="flex select-none justify-end gap-2 bg-gray-50 px-6 py-3">
        <button
          type="button"
          onclick="closeConfirmDelete()"
          class="rounded-full bg-white px-3 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
        >
          Cancel
        </button>
        <form action="catalogue_delete" method="post">
          <input
            id="confirm-delete-modal-input"
            type="hidden"
            name="id"
            value=""
          />
          <button
            type="submit"
            class="rounded-full bg-red-50 px-3 py-2 text-sm font-semibold text-red-900 ring-1 ring-inset ring-red-300 hover:bg-red-100"
          >
            Delete
          </button>
        </form>
      </div>
    </div>
  </div>
</dialog>
<style>
  #confirm-delete-modal:not([open]) {
    display: none !important;
  }

  #confirm-delete-modal::backdrop {
    background: rgba(0, 0, 0, 0.5);
    backdrop-filter: blur(16px);
  }
</style>
<script>
  function openConfirmDelete(itemName, itemId) {
    document.getElementById("confirm-delete-modal-item").innerText = itemName;
    document.getElementById("confirm-delete-modal-input").value = itemId;
    document.getElementById("confirm-delete-modal").showModal();
  }

  function closeConfirmDelete() {
    document.getElementById("confirm-delete-modal").close();
  }
</script>
