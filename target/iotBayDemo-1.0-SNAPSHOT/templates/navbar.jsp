<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="true" %>

<nav class="flex items-center justify-center p-4 px-6">
  <div class="flex w-full items-center">
    <div class="flex justify-start">
      <a class="flex items-center gap-2 rounded-full text-gray-900" href="/">
        <div class="flex items-center justify-center">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            version="1.0"
            viewBox="0 0 254 254"
            fill="currentColor"
            class="size-8"
          >
            <path
              d="M155 28v9l-15 1h-15v11c1 10 0 11-3 18l-3 7 4 1 17-1 14-2 1 4v5l-6 1h-25c-17-1-19 0-18 1 5 12 5 31 1 44-2 4-4 10-7 13l-3 7 7-3c10-5 33-11 46-12 4 0 5 0 5 2s-2 3-14 8l-32 14c-9 5-18 8-19 8l-1-10c0-8 0-8 3-9s9-11 12-22c2-6 2-9 2-18l-1-12-8-1h-7v-9c0-11 0-12 10-10l9 2c2 0 2 0 2-5 0-6-2-15-6-18-1-2-5-4-9-5l-6-3-1-6c0-9-2-9-2 0l-1 6-10 1H65v7c0 5 0 8-2 14l-3 8h23l4-1v18l-5 1a197 197 0 0 1-32 1l2 9 1 21c-1 14-2 21-8 32l-3 7 8-4c9-5 24-11 32-12h5v9l-1 11c-2 1-15 5-16 4l-1-2c-1-4-3-5-18-1l-22 4-7 2v7l2 15 2 9h156l5-9a411 411 0 0 1 33-52c1-3 2-13 1-15-1-1 8-9 21-20 7-5 11-10 10-10a525 525 0 0 0-37 25 274 274 0 0 1-22 2c-2 0-2 0-1-4 2-12 0-25-6-32-5-5-9-7-20-7l-8-1v-5l1-4 6-1 12 2 7 1 1-10c-1-8-1-11-4-16-3-7-6-9-15-10h-7l-1-10-1-10c-2 0-2 2-2 10zm10 104-4 2-3-1c0-2 1-2 4-2s4 0 3 1z"
            />
            <path
              d="M148 21c-2 0-4 1-5 3-2 3-4 4-10 2-4-1-5 0 0 2 2 1 5 2 11 2l8-1v-4c0-5 0-5-4-4zM79 36c-2 2-3 2-5 2h-1l8 1c4 0 4 0 4-3-1-3-2-4-6-1zM9 208l14 2c14 2 18 3 18 5l-4 2c-8 1-6 2 6 2 11 1 12 1 10 2l-5 2 14 1 15 1-4 2-4 3h26l10 1-3 1c-4 1-4 3 2 4l38-2c4 0 4-2 1-2l-3-1c0-2 3-3 19-3 12-1 15-2 15-3l-3-2c-4 0-6-1-4-2l14-2 13-2-4-3c-2-1 2-3 10-4l9-2a4745 4745 0 0 0-200 0z"
            />
          </svg>
        </div>
        <span class="font-serif text-base font-semibold italic">IoTBay</span>
      </a>
      <div class="ml-4 flex items-center gap-4 text-gray-600">
        <div class="h-4/5 w-px bg-gray-300"></div>
        <a class="text-sm" href="/catalogue_view">Home</a>
        <a class="text-sm <%= request.getRequestURI().endsWith("catalogue.jsp") ? "font-semibold text-gray-900" : "" %>" href="/catalogue_view">Products</a>
        <a class="text-sm" href="/catalogue_view">Orders</a>
      </div>
    </div>
    <div class="flex w-full justify-center"></div>
    <div class="flex justify-end gap-2">
      <a href="profilePage.jsp">
        <button
        class="flex flex-shrink-0 items-center justify-center gap-2 rounded-full bg-white px-3 py-2 text-sm font-semibold text-gray-900 hover:bg-gray-50"
        type="button"
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="24"
          height="24"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
          class="size-4"
        >
          <path d="M2 21a8 8 0 0 1 10.434-7.62" />
          <circle cx="10" cy="8" r="5" />
          <circle cx="18" cy="18" r="3" />
          <path d="m19.5 14.3-.4.9" />
          <path d="m16.9 20.8-.4.9" />
          <path d="m21.7 19.5-.9-.4" />
          <path d="m15.2 16.9-.9-.4" />
          <path d="m21.7 16.5-.9.4" />
          <path d="m15.2 19.1-.9.4" />
          <path d="m19.5 21.7-.4-.9" />
          <path d="m16.9 15.2-.4-.9" />
        </svg>
        <span>Account</span>
        </button>
      </a>
      <button
        class="flex flex-shrink-0 items-center justify-center gap-2 rounded-full bg-white px-3 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
        type="button"
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="24"
          height="24"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
          class="size-4"
        >
          <circle cx="8" cy="21" r="1" />
          <circle cx="19" cy="21" r="1" />
          <path
            d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12"
          />
        </svg>
        <span>Cart</span>
      </button>
    </div>
  </div>
</nav>
