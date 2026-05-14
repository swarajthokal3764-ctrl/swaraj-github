import requests

API_KEY = "YOUR_API_KEY"   # Replace with your OpenWeatherMap API key

def get_weather(city):
    url = f"https://api.openweathermap.org/data/2.5/weather?q={city}&appid={API_KEY}&units=metric"

    response = requests.get(url)

    if response.status_code == 200:
        data = response.json()

        city_name = data["name"]
        country = data["sys"]["country"]
        temperature = data["main"]["temp"]
        feels_like = data["main"]["feels_like"]
        humidity = data["main"]["humidity"]
        weather = data["weather"][0]["description"]
        wind_speed = data["wind"]["speed"]

        print("\n===== WEATHER REPORT =====")
        print(f"City: {city_name}, {country}")
        print(f"Temperature: {temperature}°C")
        print(f"Feels Like: {feels_like}°C")
        print(f"Weather: {weather}")
        print(f"Humidity: {humidity}%")
        print(f"Wind Speed: {wind_speed} m/s")

    else:
        print("City not found or API error.")

while True:
    city = input("\nEnter city name (or type exit): ")

    if city.lower() == "exit":
        print("Goodbye!")
        break

    get_weather(city)
