<!doctype html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>JSP Page</title>
    <link href="styles/common.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
  </head>
  <body>
    <div
      class="grid grid-flow-row grid-cols-2 gap-6 pl-5 pr-10 md:grid-cols-3 lg:grid-cols-4"
    >
      <div class="mb-3 flex flex-col">
        <img
          src="img/null.jpeg"
          alt
          width="800"
          height="800"
          class="h-full w-full rounded-lg object-contain text-transparent ring ring-gray-200 ring-offset-2"
        />
        <div class="mt-5 leading-4">
          <h3 class="text-md font-bold">Raspberry Pi</h3>
          <div class="mt-3 flex items-start justify-between">
            <div>
              <div class="flex items-center gap-2 text-sm">
                <div class="text-xl font-medium text-black">$999</div>
                <div class="text-gray-500">each</div>
              </div>
              <div class="mt-2 text-sm text-gray-600">Low stock</div>
            </div>
            <form method="POST" action="">
              <button
                type="submit"
                class="flex h-9 w-9 items-center justify-center rounded-full border border-[var(--primary-7)] bg-[var(--primary-3)] text-[var(--primary-11)] hover:bg-[var(--primary-4)]"
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
  </body>
</html>
