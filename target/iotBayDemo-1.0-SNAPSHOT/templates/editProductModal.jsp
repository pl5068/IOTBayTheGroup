<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="true" %>

<dialog id="edit-product-modal">
  <div class="fixed flex h-full w-full items-center justify-center">
    <form
      action="catalogue_edit"
      method="post"
      class="max-w-lg overflow-hidden rounded-lg border-gray-300 bg-white shadow-xl"
    >
      <div class="flex gap-4 p-6">
        <div class="flex flex-col gap-2">
          <h1 class="text-base font-semibold text-gray-900">Edit Item</h1>
          <p class="text-sm text-gray-500">
            Make changes to this product listing here. Click save when you're
            done.
          </p>
          <div class="mt-6 flex flex-col gap-3">
            <input id="id" name="id" type="hidden" />
            <fieldset class="flex gap-4">
              <div class="flex w-24 flex-shrink-0 items-center justify-end">
                <label class="text-sm font-semibold text-gray-500" for="name"
                  >Name</label
                >
              </div>
              <input id="name" name="name" type="text" class="text-field" />
            </fieldset>
            <fieldset class="flex gap-4">
              <div class="flex w-24 flex-shrink-0 items-start justify-end">
                <label
                  class="text-sm font-semibold text-gray-500"
                  for="description"
                  >Description</label
                >
              </div>
              <textarea
                id="description"
                name="description"
                type="text"
                class="min-h-20 w-full resize-none rounded-[var(--radius)] p-2 text-sm leading-none outline-none ring-1 ring-inset ring-[rgba(0,0,0,.2)] focus:ring-2 focus:ring-[var(--primary-8)]"
              ></textarea>
            </fieldset>
            <fieldset class="flex gap-4">
              <div class="flex w-24 flex-shrink-0 items-center justify-end">
                <label class="text-sm font-semibold text-gray-500" for="price"
                  >Price</label
                >
              </div>
              <input id="price" name="price" type="text" class="text-field" />
            </fieldset>
            <fieldset class="flex gap-4">
              <div class="flex w-24 flex-shrink-0 items-center justify-end">
                <label class="text-sm font-semibold text-gray-500" for="stock"
                  >Stock</label
                >
              </div>
              <input id="stock" name="stock" type="text" class="text-field" />
            </fieldset>
            <fieldset class="flex gap-4">
              <div class="flex w-24 flex-shrink-0 items-center justify-end">
                <label
                  class="text-sm font-semibold text-gray-500"
                  for="category"
                  >Category</label
                >
              </div>
              <input
                id="category"
                name="category"
                type="text"
                class="text-field"
              />
            </fieldset>
          </div>
        </div>
      </div>
      <div class="flex select-none justify-end gap-2 bg-gray-50 px-6 py-3">
        <button
          type="button"
          onclick="closeEditProduct()"
          class="rounded-full bg-white px-3 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
        >
          Cancel
        </button>
        <button
          type="submit"
          class="rounded-full bg-emerald-50 px-3 py-2 text-sm font-semibold text-emerald-900 ring-1 ring-inset ring-emerald-300 hover:bg-emerald-100"
        >
          Save Changes
        </button>
      </div>
    </form>
  </div>
</dialog>
<style>
  #edit-product-modal:not([open]) {
    display: none !important;
  }

  #edit-product-modal::backdrop {
    background: rgba(0, 0, 0, 0.5);
    backdrop-filter: blur(16px);
  }
</style>
<script>
  function openEditProduct(
    itemName,
    itemId,
    itemDescription,
    itemPrice,
    itemStock,
    category,
  ) {
    document.getElementById("name").value = itemName;
    document.getElementById("id").value = itemId;
    document.getElementById("description").value = itemDescription;
    document.getElementById("price").value = itemPrice;
    document.getElementById("stock").value = itemStock;
    document.getElementById("category").value = category;
    document.getElementById("edit-product-modal").showModal();
  }

  function closeEditProduct() {
    document.getElementById("edit-product-modal").close();
  }
</script>
