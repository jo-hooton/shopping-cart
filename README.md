# 🛒 Shopping Cart (Rails + Turbo + Stimulus + Tailwind CSS)

A simple **shopping cart application** built with **Ruby on Rails, Turbo Streams, Stimulus.js, and Tailwind CSS**.

---

## 🚀 Features

### 🛍️ Product Catalog

- Browse the **product catalog**.
- **Add products to the cart**.

### 🛒 Cart Page

- **Change item quantities** dynamically.
- **Remove items** from the cart.
- **Reset the cart** (clears all items).
- **Amounts update in real-time** as the cart changes.
- **"Place Order" button clears the cart** (marks all items as paid).
- **Discount Slider**
  - Adjusts the discount amount applied to the cart.
  - The **maximum discount is $100**.
  - Dynamically updates the total price.

---

## 💻 Running the App Locally

### 1️⃣ Clone the Repo

### 2️⃣ Install Dependencies

Ensure you have **Ruby & Bundler** installed, then run:

```sh
bundle install
```

### 3️⃣ Setup the Database

```sh
rails db:create db:migrate db:seed
```

_(Seeding adds sample products to the catalog.)_

### 4️⃣ Start the Rails Server

```sh
bin/dev
```

_(Runs Rails + Tailwind + Turbo Streams.)_

### 5️⃣ Open in Browser

Visit **[http://localhost:3000](http://localhost:3000)**

---

## 🛠️ Tech Stack

- **Ruby on Rails**
- **Turbo Streams & Turbo Frames** (Hotwire for real-time UI updates)
- **Stimulus.js** (Custom JavaScript controllers)
- **Tailwind CSS** (Styling)
- **PostgreSQL or SQLite** (Database)

---

## ⚡ Key Implementation Details

- Uses **Turbo Streams & Turbo Frames** for **instant UI updates**.
- **Stimulus.js handles dynamic elements** like the discount slider & cart quantity buttons.
- The **cart persists in the session**, so users don't lose their cart on refresh.

---

## 🚀 Future Improvements

- **Persist cart discount in the database** so it does not reset when cart items are added or updated.
- **Add images to products** for a better user experience.
- **Improve mobile responsiveness** to enhance usability on smaller screens.
- **Add user authentication** so different users can have separate carts.
- **Implement order history** tracking to allow users to view past purchases.
- **Enhance checkout process** by integrating a payment gateway (e.g., Stripe, PayPal).
