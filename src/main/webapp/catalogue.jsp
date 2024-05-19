<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
    <head>
        <jsp:include page="/templates/common.jsp" />
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="isAdmin" value="true" />

        <jsp:include page="/templates/navbar.jsp" />
        <div class="max-w-5xl mx-auto">
            <form class="mt-4 mb-12" action="catalogue_view" method="GET">



                <div class="flex flex-col">
                    <div class="relative">
                        <input type="text" name="search" class="w-full relative flex rounded-xl bg-white text-base h-12 px-4 outline-none ring-1 ring-inset ring-[rgba(0,0,0,.2)] focus:ring-2 focus:ring-[var(--primary-8)]" placeholder="Search the catalogue..." />
                        <button type="submit" class="flex items-center absolute right-0 inset-y-0 px-4 text-gray-600">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="size-6"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/></svg>
                        </button>
                    </div>
                    <div class="flex mt-3 justify-between select-none">
                        <div class="flex gap-2">
                            <div class="relative">
                                <select name="sort" class="appearance-none flex flex-shrink-0 items-center justify-center gap-2 rounded-lg bg-white px-3 pr-10 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50">
                                    <option value="name">Best match</option>
                                    <option value="price">Price (low to high)</option>
                                    <option value="price_desc">Price (high to low)</option>
                                </select>
                                <div class="flex items-center absolute right-0 inset-y-0 px-3 pointer-events-none">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="size-4"><path d="m7 15 5 5 5-5"/><path d="m7 9 5-5 5 5"/></svg>
                                </div>
                            </div>
                            <div class="relative">
                                <select name="category" class="appearance-none flex flex-shrink-0 items-center justify-center gap-2 rounded-lg bg-white px-3 pr-10 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50">
                                    <option value="all">All categories</option>
                                    <c:forEach var="category" items="${categories}">
                                        <option value="${category}">${category}</option>
                                    </c:forEach>
                                </select>
                                <div class="flex items-center absolute right-0 inset-y-0 px-3 pointer-events-none">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="size-4"><path d="m7 15 5 5 5-5"/><path d="m7 9 5-5 5 5"/></svg>
                                </div>
                            </div>
                            <div class="flex flex-shrink-0 items-center justify-center gap-2 rounded-lg bg-white px-3 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50">
                                <input type="checkbox" name="inStock" id="inStock" />
                                <label for="inStock">In stock only</label>
                            </div>
                        </div>

                        <div class="flex items-center gap-2">
                            <button type="submit" class="flex gap-2 w-full px-3 py-2 text-sm font-semibold items-center justify-center rounded-full ring-1 ring-inset ring-[var(--primary-7)] bg-[var(--primary-3)] text-[var(--primary-11)] hover:bg-[var(--primary-4)]">Apply Filters</button>
                            <c:if test="${isAdmin}">
                                <button onclick="openAddProduct()" type="button" class="flex flex-shrink-0 items-center gap-2 rounded-full bg-emerald-50 px-3 py-2 text-sm font-semibold text-emerald-900 ring-1 ring-inset ring-emerald-300 hover:bg-emerald-100">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="size-4"><path d="M5 12h14"/><path d="M12 5v14"/></svg>
                                    <span>Add Item</span>
                                </button>
                            </c:if>
                        </div>
                    </div>
                </div>
            </form>

            <c:if test="${empty products}">
                <div class="flex h-screen items-center justify-center">
                    <div class="text-2xl font-bold text-gray-500">No products found</div>
                </div>
            </c:if>
            <c:if test="${not empty products}">
                <div
                    class="grid grid-flow-row grid-cols-2 gap-6 px-1 md:grid-cols-3 lg:grid-cols-4"
                    >
                    <c:forEach var="product" items="${products}">
                        <div class="flex flex-col gap-4">
                            <img
                                src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAAtJREFUGFdjYAACAAAFAAGq1chRAAAAAElFTkSuQmCC"
                                data-src="images/product/${product.id}.jpg"
                                alt
                                width="800"
                                height="800"
                                class="h-full w-full rounded-lg object-contain text-transparent ring ring-gray-200 ring-offset-2"
                                />
                            <div class="flex flex-col">
                                <h3 class="text-md font-semibold text-gray-900">${product.name}</h3>
                                <p class="text-base text-gray-500 min-h-6">${product.description}</p>
                                <div class="flex gap-2 items-end">
                                    <div class="flex text-2xl font-bold leading-6 mt-3">
                                        <span class="relative top-[-1px] text-xs">$</span>
                                        <span>${product.getDollars()}</span>
                                        <c:if test="${product.getCents() != 0}">
                                            <span class="relative top-[-1px] text-xs">.${product.getCents()}</span>
                                        </c:if>
                                    </div>
                                    <span class="text-sm text-gray-500 leading-6">per unit</span>
                                </div>
                                <div class="flex gap-2 mt-4">
                                    <form action="order_add" method="post" class="delivery-box">
                                  
                                        <input type="hidden" name="productId" placeholder="Product ID" value="${product.id}">
                                        
                                        <button type="submit" class="flex gap-2 w-full px-3 py-2 text-sm font-semibold items-center justify-center rounded-full ring-1 ring-inset ring-[var(--primary-7)] bg-[var(--primary-3)] text-[var(--primary-11)] hover:bg-[var(--primary-4)]">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="size-4">
                                            <circle cx="8" cy="21" r="1"/>
                                            <circle cx="19" cy="21" r="1"/>
                                            <path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12"/>
                                            </svg>
                                            <span>Add to Cart</span>
                                        </button>
                                    </form>
                                    <c:if test="${isAdmin}">
                                        <button class="flex flex-shrink-0 justify-center items-center rounded-full bg-white w-9 h-9 text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50" onclick="openEditProduct('${product.name}', '${product.id}', '${product.description}', '${product.unitPrice}', '${product.unitStock}', '${product.category}')">
                                            <div class="sr-only">Edit</div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="size-4"><path d="M17 3a2.85 2.83 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/><path d="m15 5 4 4"/></svg>
                                        </button>
                                        <button class="flex flex-shrink-0 justify-center items-center rounded-full bg-white w-9 h-9 text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50" onclick="openConfirmDelete('${product.name}', '${product.id}')">
                                            <div class="sr-only">Delete</div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="size-4"><path d="M3 6h18"/><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"/><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"/><line x1="10" x2="10" y1="11" y2="17"/><line x1="14" x2="14" y1="11" y2="17"/></svg>
                                        </button>
                                    </c:if>
                                </div>
                                <div class="flex text-sm text-gray-700 items-center mt-3">
                                    <c:if test="${product.unitStock == 0}">
                                        <div class="size-2 rounded-full bg-red-500"></div>
                                        <span class="ml-2">Out of stock</span>
                                    </c:if>
                                    <c:if test="${product.unitStock > 0 && product.unitStock < 10}">
                                        <div class="size-2 rounded-full bg-amber-500"></div>
                                        <span class="ml-2">Low stock!</span>
                                    </c:if>
                                    <c:if test="${product.unitStock >= 10}">
                                        <div class="size-2 rounded-full bg-emerald-500"></div>
                                        <span class="ml-2">In stock</span>
                                    </c:if>
                                    <c:if test="${product.unitStock > 0}">
                                        <span class="ml-1 opacity-65">(${product.unitStock} items)</span>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
        </div>

        <c:if test="${isAdmin}">
            <jsp:include page="/templates/confirmDeletionModal.jsp" />
            <jsp:include page="/templates/editProductModal.jsp" />
            <jsp:include page="/templates/addProductModal.jsp" />
        </c:if>
        <script src="scripts/images.js" defer></script>
    </body>
</html>
