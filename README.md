# 💱 Currency Converter - Spring Boot

A simple **currency converter web app** built with **Spring Boot** that fetches live exchange rates using the [Frankfurter API](https://www.frankfurter.app/).  
The app runs locally at **http://localhost:8080** and allows you to convert between multiple currencies.

---

## 🚀 Features
- Convert between popular currencies (USD, INR, EUR, GBP, JPY, AUD, CAD and more).
- Fetches **live exchange rates** from Frankfurter API.
- Clean UI with simple form-based input.
- Runs locally using Spring Boot.

---

## 🛠️ Tech Stack
- **Java 17**
- **Spring Boot 3**
- **Thymeleaf** (for HTML templates)
- **Gradle** (build tool)
- **CSS** (custom styling)

---

## 📂 Project Structure
demo/
├── src/main/java/com/example/demo
│ ├── controller
│ │ └── CurrencyController.java
│ └── DemoApplication.java
│
├── src/main/resources
│ ├── templates
│ │ └── convert.html
│ └── static/css
│ └── style.css
│
├── build.gradle
└── settings.gradle


---

## ⚡ Getting Started

### 1. Clone the repository
```bash
git clone https://github.com/your-username/currency-converter-java.git
cd currency-converter-java

2. Run the application

Using Gradle:

./gradlew bootRun   # Linux/Mac
gradlew.bat bootRun # Windows

3. Open in browser

Visit:

http://localhost:8080

API Reference

We use Frankfurter API
 to fetch real-time exchange rates.

Example:

https://api.frankfurter.app/latest?amount=100&from=USD&to=INR
