<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>shopclues.com</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .gallery-container {
            overflow: hidden;
            width: 80%;
            margin: 50px auto;
        }

        .gallery-wrapper {
            display: flex;
            transition: transform 0.5s ease-in-out;
        }

        .gallery-item {
            min-width: 100%;
            box-sizing: border-box;
        }

        img1 {
            width: 100%;
            height: auto;
            display: block;
        } 

        .prev-btn,
        .next-btn {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -22px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
        }

        .prev-btn {
            left: 0;
        }

        .next-btn {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        .prev-btn:hover,
        .next-btn:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }
    </style>
</head>
<body>
    <header style="background-color: #0095b6;">
        <div class="logo">
        <img src="https://tse1.mm.bing.net/th?id=OIP.ccAk4ftbru1PxSraZsdWawHaBs&pid=Api&P=0&h=180" style="width:300px; height:100px">
        
    <nav>
    <a href="home.jsp">Home</a>
    <% 
        if (session.getAttribute("customerId") != null) {
    %>
            <a href="logout.jsp">Logout</a>
    <% 
        } else {
    %>
            <a href="login.html">Login</a>
    <% 
        }
    %>
    <a href="Aboutus.html">About Us</a>
    <a href="contact.jsp">Contact</a>
    <a href="cartlist.jsp">Cart</a>
</nav>


        </div>
    </header>

    <section class="hero-section">
        <div class="gallery-container">
    <div class="gallery-wrapper">
        <div class="gallery-item">
            <img1 src="https://cdn.shopclues.com/images/banners/2023/Dec/12/HB1_WinterSale_Web_SYM_12Dec23.jpg" alt="Image 1">
        </div>
        <div class="gallery-item">
            <img1 src="https://cdn.shopclues.com/images/banners/Intel/Evo01/Evo1_2760x690_W.jpg" alt="Image 2">
        </div>
        <div class="gallery-item">
            <img1 src="https://cdn.shopclues.com/images/banners/2023/Nov/08/HB2_Refurb_Web_Esha_7thNov23.jpg" alt="Image 3">
        </div>
        <!-- Add more gallery items as needed -->
    </div>

    <div class="prev-btn" onclick="prevSlide()">&#10094;</div>
    <div class="next-btn" onclick="nextSlide()">&#10095;</div>
</div>

<script>
    let currentIndex = 0;

    function showSlide(index) {
        const galleryWrapper = document.querySelector('.gallery-wrapper');
        const galleryItems = document.querySelectorAll('.gallery-item');

        if (index < 0) {
            currentIndex = galleryItems.length - 1;
        } else if (index >= galleryItems.length) {
            currentIndex = 0;
        } else {
            currentIndex = index;
        }

        const translateValue = -currentIndex * 100 + '%';
        galleryWrapper.style.transform = 'translateX(' + translateValue + ')';
    }

    function prevSlide() {
        showSlide(currentIndex - 1);
    }

    function nextSlide() {
        showSlide(currentIndex + 1);
    }
   
    function redirectToPage(pageURL) {
        window.location.href = pageURL;
    }


</script>
<input type="button" value="Women Section" onclick="redirectToPage('women.jsp')" style="padding: 15px; background-color: #FBAB7E; background-image: linear-gradient(62deg, #FBAB7E 0%, #F7CE68 100%); margin:10px; border-radius:10px; width:20%">
<input type="button" value="Men Section " onclick="redirectToPage('men.jsp')" style="padding: 15px; background-color: #FBAB7E; background-image: linear-gradient(62deg, #FBAB7E 0%, #F7CE68 100%); margin:10px; border-radius:10px; width:20%">


</body>
         
    </section>
    
    <h1>Women Dresses</h1>
    <section>
        <div class="dress">
            <img src="https://cdn.shopclues.com/images1/thumbnails/117330/200/200/153427981-117330096-1692000804.jpg" alt="Dress 1">
            <h2>Floral Summer Dress</h2>
            <p>Perfect for a sunny day!</p>
            <p>525.00</p>
            <p>rating:3.5</p>
        </div>

        <div class="dress">
            <img src="https://cdn.shopclues.com/images1/thumbnails/111888/200/200/151360366-111888775-1659198224.jpg" alt="Dress 2">
            <h2>SVB SAREE dark blue orange</h2>
            <p>458.00</p>
            <p>rating:4.5</p>
        </div>
  
        <div class="dress">
            <img src="https://cdn.shopclues.com/images1/thumbnails/117330/200/200/153428024-117330227-1692001370.jpg" alt="Dress 2">
            <h2>Oceanista red gown</h2>
            <p>658.00</p>
            <p>rating:4.0</p>
        </div>
        <div class="dress">
            <img src="https://cdn.shopclues.com/images1/thumbnails/111456/200/200/151223219-111456993-1602767765.jpg" alt="Dress 2">
            <h2>crop top</h2>
            <p>358.00</p>
            <p>rating:3.8</p>
        </div>
        <div class="dress">
            <img src="https://cdn.shopclues.com/images1/thumbnails/117299/280/1/153416865-117299559-1690623845.jpg" alt="Dress 2">
            <h2>Women kurti </h2>
            <p>458.00</p>
            <p>rating:3.9</p>
        </div>
        
        </section>

    <h1>Men's section</h1>
    <section >
        
        <div class="dress">
        <img src="https://cdn.shopclues.com/images1/thumbnails/117329/200/200/153427733-117329279-1691743904.jpg" alt=""/>
        <h2>Men's solid orange shirt</h2>
        <p>677.00</p>
        <p>rating:3.9</p>
        </div>
        <div class="dress">
        <img src="https://cdn.shopclues.com/images1/thumbnails/116966/200/200/153319199-116966140-1678960917.jpg" alt=""/>
        <h2>Casual shirt</h2>
        <p>456.00</p>
        <p>rating:4.00</p>
        </div>
        <div class="dress">
        <img src="https://cdn.shopclues.com/images1/thumbnails/90407/200/200/139982862-90407351-1700746339.jpg" alt=""/>
        <h2>Men's strechtable jeans</h2>
        <p>599.00</p>
        <p>rating:4.00</p>
        </div>
        <div class="dress">
        <img src="https://cdn.shopclues.com/images1/thumbnails/117232/200/200/153399179-117232153-1700745729.jpg" alt=""/>
        <h2>Cotton men's light jeans</h2>
        <p>559.00</p>
        <p>rating:3.5</p>
        </div>
        <div class="dress">
        <img src="https://cdn.shopclues.com/images1/thumbnails/117340/320/320/153430902-117340521-1692957186.jpg" alt=""/>
        <h2>Modernity Khaki Regular Fit Shirt For Men</h2>
         <p>348.00</p>
        <p>rating:3.6</p>
        </div>
        <div class="dress">
        <img src="https://cdn.shopclues.com/images1/thumbnails/113214/320/320/152000676-113214736-1668508686.jpg" alt=""/>
        <h2>Shirt</h2>
         <p>378.00</p>
        <p>rating:3.6</p>
        </div>
    </section>
     <h1>Footwear</h1>
     <section>     <div class="dress">
     <img src="https://cdn.shopclues.com/images1/thumbnails/117212/200/200/153394780-117212712-1687161430.jpg" alt=""/>
     <h2>Imcolus Tan Leather Lace-up Boot For Men</h2>
     <p>749.00</p>
     <p>rating:3.3</p>
     </div>
     <div class="dress">
     <img src="https://cdn.shopclues.com/images1/thumbnails/13001/320/320/109527907-13001218-1667812659.jpg" alt=""/>
     <h2>Woakers Men's Brown Casual Boot</h2>
     <p>749.00</p>
     <p>rating:3.8</p></div> 
     <div class="dress">
     <img src="https://cdn.shopclues.com/images1/thumbnails/108199/320/320/150226965-108199628-1664548714.jpg" alt=""/>
     <h2>Richale X1 135 Black Sandal for Men</h2>
     <p>348.00</p>
     <p>rating:3.6</p></div> 
     <div class="dress">
     <img src="https://cdn.shopclues.com/images1/thumbnails/117390/320/320/153450330-117390351-1697537581.jpg" alt=""/>
     <h2>Exclusive Ultralight Canvas Sport</h2>
     <p>849.00</p>
     <p>rating:4.3</p></div> 
     <div class="dress">
     <img src="https://cdn.shopclues.com/images1/thumbnails/100783/320/320/146418543-100783703-1668507223.jpg" alt=""/>
     <h2>MR Cobbler Tan Slip on Sandals For Men</h2>
     <p>549.00</p>
     <p>rating:4.00</p></div> 
     <div class="dress">
     <img src="https://cdn.shopclues.com/images1/thumbnails/117212/320/320/153394803-117212803-1687162836.jpg" alt=""/>
     <h2>Imcolus Red Mesh Running Shoes For Men</h2>
    <p>449.00</p>
    <p>rating4.3</p></div>   
     </section>
     <h1>Your Gadget Store</h1>
    <section>
    <div class="dress">
    <img src="https://cdn.shopclues.com/images1/thumbnails/114088/320/320/152299036-114088215-1692017670.jpg" alt=""/>
    <h2>Gionee 2.4 Amp Micro USB Cable Quick Fast Charging Cable </h2>
    <p>248.00</p>
    <p>rating:3.9</p>
    </div>
    <div class="dress">
    <img src="https://cdn.shopclues.com/images1/thumbnails/116370/320/320/153077649-116370263-1671296409.jpg" alt=""/>
    <h2>Digitech Wireless Earbuds With Charging Case Active Noise Cancellation Bluetooth Headset with Mic</h2>
    <p>349.00</p>
    <p>3.9</p>
    </div>
    <div class="dress">
    <img src="https://cdn.shopclues.com/images1/thumbnails/92954/320/320/141125300-92954383-1668508437.jpg" alt=""/>
    <h2>MDR XB-450 Stereo Dynamic Over the Ear Wired Headphones</h2>
    <p>359.00</p>
    <p>rating:3.5</p>
    </div>
    <div class="dress">
    <img src="https://cdn.shopclues.com/images1/thumbnails/117447/320/320/153465244-117447408-1702468277.jpg" alt=""/>
    <h2>TECHFIRE 500v2 Neckband hi-bass Wireless headphone Bluetooth Headset </h2> 
    <p>457.00</p>
    <p>rating:3.4</p>
    </div>
   <div class="dress">
    <img src="https://cdn.shopclues.com/images1/thumbnails/116331/320/320/153072233-116331776-1683542496.jpg" alt=""/>
    <h2>P47 Wireless Bluetooth Portable Sports Headphones with Microphone</h2>
    <p>567.00</p>
    <p>rating:4.00</p>
    </div>
    <div class="dress">
    <img src="https://cdn.shopclues.com/images1/thumbnails/113707/200/200/152189193-113707888-1618398381.jpg" alt=""/>
    <h2>Moonwalk Smart Watch Id-116 Bluetooth Smartwatch Wireless </h2>
    <p>449.00</p>
    <p>rating4.3</p>
    </div>
       
    </section>

   <footer>
    <p>&copy; 2023 Your eCommerce Website</p>
    <nav>
      <a href="#">Home</a>
      <a href="#">Shop</a>
      <a href="#">About Us</a>
      <a href="#">Contact</a>
      
    </nav>
    <p>Follow us on social media:</p>
    <a href="#" target="_blank">Facebook</a>
    <a href="#" target="_blank">Twitter</a>
    <a href="#" target="_blank">Instagram</a>
  </footer>
</body>
</html>