package com.example;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping
@AllArgsConstructor
public class HomeController {

	private SimpMessagingTemplate msgTemp;

	@GetMapping
	public String getHomePage() {

		return "home";
	}

	@Scheduled(fixedDelay = 1000)
	public void getPriceData() {
		msgTemp.convertAndSend("/topic/price_data", simulatePriceChange());

	}

	private static Map<String, Double> DATA_MAP = new LinkedHashMap<>();
	static {
		DATA_MAP.put("btc", Double.valueOf(17000.00));
		DATA_MAP.put("doge", Double.valueOf(1.00));
		DATA_MAP.put("ltc", Double.valueOf(50.00));
	}

	private static final Random GENERATOR = new Random();

	private List<PriceData> simulatePriceChange() {
		List<PriceData> result = new ArrayList<>();

		DATA_MAP.keySet().forEach(coin -> {
			double r = GENERATOR.nextGaussian() / 10;
			double newPrice = DATA_MAP.get(coin).doubleValue() + (r * DATA_MAP.get(coin).doubleValue());
			result.add(PriceData.builder().symbol(coin).price(BigDecimal.valueOf(newPrice)).build());

		});

		return result;
	}

}
