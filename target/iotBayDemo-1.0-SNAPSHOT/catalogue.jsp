<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>IoT Bay</title>
    <link href="styles/common.css" rel="stylesheet" type="text/css" />
    <link href='styles/index.css' rel="stylesheet" type="text/css">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <div class="container mx-auto my-8">
        <h2 class="text-2xl font-bold mb-6 text-center">IoT Bay</h2>
        <% if (request.getSession().getAttribute("user") != null) { %>
            <h1 class="mb-6">Welcome, <jsp:getProperty name="user" property="firstName"/>!</h1>
        <% } else { %>
            <a href="logInPage.jsp" class="text-blue-500 hover:underline mb-6 block text-center">Please login</a>
        <% } %>
        <div class="flex flex-wrap justify-center -mx-8">
            <!-- Raspberry Pi Card -->
            <div class="w-full md:w-1/2 lg:w-1/3 px-8 mb-16">
                <div class="flex bg-white shadow-md rounded-lg overflow-hidden">
                    <div class="w-1/2 flex-shrink-0">
                        <img src="img/raspberrypi.jpg" alt="" class="w-full h-full object-contain">
                    </div>
                    <div class="w-1/2 p-8">
                        <h3 class="text-lg font-bold">Raspberry Pi</h3>
                        <div class="flex justify-between items-center mt-3">
                            <div>
                                <div class="flex text-base items-center gap-2">
                                    <div class="text-2xl font-medium text-black">$999</div>
                                    <div class="text-gray-500">each</div>
                                </div>
                                <div class="text-base mt-2 text-gray-600">Low stock</div>
                            </div>
                            <form>
                                <button type="submit" class="flex items-center justify-center w-12 h-12 bg-[var(--primary-3)] text-[var(--primary-11)] border border-[var(--primary-7)] rounded-full hover:bg-[var(--primary-4)]">
                                    <div class="sr-only">Add to cart</div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus">
                                        <path d="M5 12h14" />
                                        <path d="M12 5v14" />
                                    </svg>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Arduino Uno Card -->
            <div class="w-full md:w-1/2 lg:w-1/3 px-8 mb-16">
                <div class="flex bg-white shadow-md rounded-lg overflow-hidden">
                    <div class="w-1/2 flex-shrink-0">
                        <img src="img/arduinouno.jpg" alt="" class="w-full h-full object-contain">
                    </div>
                    <div class="w-1/2 p-8">
                        <h3 class="text-lg font-bold">Arduino Uno</h3>
                        <div class="flex justify-between items-center mt-3">
                            <div>
                                <div class="flex text-base items-center gap-2">
                                    <div class="text-2xl font-medium text-black">$29.99</div>
                                    <div class="text-gray-500">each</div>
                                </div>
                                <div class="text-base mt-2 text-gray-600">In stock</div>
                            </div>
                            <form>
                                <button type="submit" class="flex items-center justify-center w-12 h-12 bg-[var(--primary-3)] text-[var(--primary-11)] border border-[var(--primary-7)] rounded-full hover:bg-[var(--primary-4)]">
                                    <div class="sr-only">Add to cart</div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus">
                                        <path d="M5 12h14" />
                                        <path d="M12 5v14" />
                                    </svg>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ESP32 Board Card -->
            <div class="w-full md:w-1/2 lg:w-1/3 px-8 mb-16">
                <div class="flex bg-white shadow-md rounded-lg overflow-hidden">
                    <div class="w-1/2 flex-shrink-0">
                        <img src="img/esp32.jpg" alt="" class="w-full h-full object-contain">
                    </div>
                    <div class="w-1/2 p-8">
                        <h3 class="text-lg font-bold">ESP32 Board</h3>
                        <div class="flex justify-between items-center mt-3">
                            <div>
                                <div class="flex text-base items-center gap-2">
                                    <div class="text-2xl font-medium text-black">$19.99</div>
                                    <div class="text-gray-500">each</div>
                                </div>
                                <div class="text-base mt-2 text-gray-600">In stock</div>
                            </div>
                            <form>
                                <button type="submit" class="flex items-center justify-center w-12 h-12 bg-[var(--primary-3)] text-[var(--primary-11)] border border-[var(--primary-7)] rounded-full hover:bg-[var(--primary-4)]">
                                    <div class="sr-only">Add to cart</div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus">
                                        <path d="M5 12h14" />
                                        <path d="M12 5v14" />
                                    </svg>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Repeat the structure for the remaining products -->
            <!-- Another Raspberry Pi Card -->
            <div class="w-full md:w-1/2 lg:w-1/3 px-8 mb-16">
                <div class="flex bg-white shadow-md rounded-lg overflow-hidden">
                    <div class="w-1/2 flex-shrink-0">
                        <img src="img/raspberrypi.jpg" alt="" class="w-full h-full object-contain">
                    </div>
                    <div class="w-1/2 p-8">
                        <h3 class="text-lg font-bold">Raspberry Pi</h3>
                        <div class="flex justify-between items-center mt-3">
                            <div>
                                <div class="flex text-base items-center gap-2">
                                    <div class="text-2xl font-medium text-black">$999</div>
                                    <div class="text-gray-500">each</div>
                                </div>
                                <div class="text-base mt-2 text-gray-600">Low stock</div>
                            </div>
                            <form>
                                <button type="submit" class="flex items-center justify-center w-12 h-12 bg-[var(--primary-3)] text-[var(--primary-11)] border border-[var(--primary-7)] rounded-full hover:bg-[var(--primary-4)]">
                                    <div class="sr-only">Add to cart</div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus">
                                        <path d="M5 12h14" />
                                        <path d="M12 5v14" />
                                    </svg>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Another Arduino Uno Card -->
            <div class="w-full md:w-1/2 lg:w-1/3 px-8 mb-16">
                <div class="flex bg-white shadow-md rounded-lg overflow-hidden">
                    <div class="w-1/2 flex-shrink-0">
                        <img src="img/arduinouno.jpg" alt="" class="w-full h-full object-contain">
                    </div>
                    <div class="w-1/2 p-8">
                        <h3 class="text-lg font-bold">Arduino Uno</h3>
                        <div class="flex justify-between items-center mt-3">
                            <div>
                                <div class="flex text-base items-center gap-2">
                                    <div class="text-2xl font-medium text-black">$29.99</div>
                                    <div class="text-gray-500">each</div>
                                </div>
                                <div class="text-base mt-2 text-gray-600">In stock</div>
                            </div>
                            <form>
                                <button type="submit" class="flex items-center justify-center w-12 h-12 bg-[var(--primary-3)] text-[var(--primary-11)] border border-[var(--primary-7)] rounded-full hover:bg-[var(--primary-4)]">
                                    <div class="sr-only">Add to cart</div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus">
                                        <path d="M5 12h14" />
                                        <path d="M12 5v14" />
                                    </svg>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Another ESP32 Board Card -->
            <div class="w-full md:w-1/2 lg:w-1/3 px-8 mb-16">
                <div class="flex bg-white shadow-md rounded-lg overflow-hidden">
                    <div class="w-1/2 flex-shrink-0">
                        <img src="img/esp32.jpg" alt="" class="w-full h-full object-contain">
                    </div>
                    <div class="w-1/2 p-8">
                        <h3 class="text-lg font-bold">ESP32 Board</h3>
                        <div class="flex justify-between items-center mt-3">
                            <div>
                                <div class="flex text-base items-center gap-2">
                                    <div class="text-2xl font-medium text-black">$19.99</div>
                                    <div class="text-gray-500">each</div>
                                </div>
                                <div class="text-base mt-2 text-gray-600">In stock</div>
                            </div>
                            <form>
                                <button type="submit" class="flex items-center justify-center w-12 h-12 bg-[var(--primary-3)] text-[var(--primary-11)] border border-[var(--primary-7)] rounded-full hover:bg-[var(--primary-4)]">
                                    <div class="sr-only">Add to cart</div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus">
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
    </div>
</body>
</html>
