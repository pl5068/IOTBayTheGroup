<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="fixed bottom-4 right-4 z-50" id="toast" aria-hidden="true" tabindex="-1">
  <div
    class="flex w-full min-w-full max-w-xs gap-3 rounded-lg bg-white p-4 text-base shadow-lg ring-1 ring-inset ring-gray-300"
  >
    <c:if test="${param.variant eq 'error'}">
      <div
      class="flex h-8 w-8 flex-shrink-0 items-center justify-center rounded-full bg-red-100 text-red-600"
    >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
          class="h-4 w-4"
        >
          <path
            d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3"
          ></path>
          <path d="M12 9v4"></path>
          <path d="M12 17h.01"></path>
        </svg>
      </div>
    </c:if>
    <div class="flex flex-col gap-1">
      <h3 class="text-sm font-semibold text-gray-900">
        <c:out value="${param.title}" />
      </h3>
      <p class="text-sm text-gray-700">
        <c:out value="${param.message}" />
      </p>
    </div>
  </div>
</div>
<style>
@keyframes slideOut {
  0% {
    transform: translateY(0);
  }
  100% {
    opacity: 0;
    transform: translateY(200%);
  }
}

#toast {
  pointer-events: none;;
  animation: slideOut 1s forwards 5s;
}
</style>
