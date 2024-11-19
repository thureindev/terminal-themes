import { getQuotes, getRandomQuote, getDayOfQuote } from 'motivate-quotes';

// Fetch quotes from a specific category
try {
  const quotes = getQuotes({
    author: false,
    numberOfQuotes: 2,
    category: 'Programming',
  });
  console.log(quotes);
} catch (error) {
  console.error(error.message);
}