package com.example.currencyconverter.controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;
import java.util.Map;

@RestController
@RequestMapping("/api/currency")
public class CurrencyController {

    private final String API_KEY = "YOUR_API_KEY"; // Replace with your key
    private final String BASE_URL = "https://v6.exchangerate-api.com/v6/";

    private final WebClient webClient = WebClient.create();

    @GetMapping("/convert")
    public Mono<Map<String, Object>> convertCurrency(
            @RequestParam double amount,
            @RequestParam String from,
            @RequestParam String to) {

        String url = BASE_URL + API_KEY + "/latest/" + from;

        return webClient.get()
                .uri(url)
                .retrieve()
                .bodyToMono(Map.class)
                .map(response -> {
                    Map<String, Object> rates = (Map<String, Object>) response.get("conversion_rates");
                    double rate = Double.parseDouble(rates.get(to).toString());
                    double converted = amount * rate;

                    return Map.of(
                            "amount", amount,
                            "from", from,
                            "to", to,
                            "rate", rate,
                            "converted", converted
                    );
                });
    }
}
