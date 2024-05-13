<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>JSP Page</title>
    <link href="styles/common.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
  </head>
  <body>
    <div
      class="pl-5 pr-10 grid grid-flow-row gap-6 grid-cols-2 md:grid-cols-3 lg:grid-cols-4"
    >
      <div class="flex flex-col mb-3">
        <img
          src="img/null.jpeg"
          alt
          width="800"
          height="800"
          class="w-full h-full object-contain text-transparent ring ring-gray-200 ring-offset-2 rounded-lg"
        />
        <div class="leading-4 mt-5">
          <h3 class="text-md font-bold">Raspberry Pi</h3>
          <div class="flex justify-between items-start mt-3">
            <div>
              <div class="flex text-sm items-center gap-2">
                <div class="text-xl font-medium text-black">$999</div>
                <div class="text-gray-500">each</div>
              </div>
              <div class="text-sm mt-2 text-gray-600">Low stock</div>
            </div>
            <form method="POST" action="">
              <button
                type="submit"
                class="flex items-center justify-center w-9 h-9 bg-[var(--primary-3)] text-[var(--primary-11)] border border-[var(--primary-7)] rounded-full hover:bg-[var(--primary-4)]"
              >
                <div class="sr-only">Add to cart</div>
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
                  class="lucide lucide-plus"
                >
                  <path d="M5 12h14" />
                  <path d="M12 5v14" />
                </svg>
              </button>
            </form>
          </div>
        </div>
      </div>
      </div>
    </div>
  </body>
</html>
