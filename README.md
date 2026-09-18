# Upagraha Vedic Astrology — Starter Website

A free-testing starter website for computing and explaining classical Vedic Upagrahas.

## Important
- This is an educational astrology application, not a scientific/medical/financial prediction tool.
- The site deliberately shows the calculation convention used for each point because classical sources differ, especially for Gulika/Mandi.
- Sun-derived points: Dhuma, Vyatipata, Parivesha, Indrachapa, Upaketu.
- Time-based points: Gulika/Mandi and the five Kaala Velas (Kaala, Mrityu, Yamaghantaka, Ardhaprahara).
- The calculation engine in this starter is intentionally transparent and modular. For production-grade ephemeris accuracy, connect a trusted Swiss Ephemeris backend and a timezone/geocoding service.
- Never claim an astrological remedy is guaranteed to produce an outcome. Present remedies as traditional practices.

## Sources used for the research notes
- Brihat Parashara Hora Shastra, Chapter 3, verses 61–70: classical formulas for the Dhuma group and time-based Kaala Velas.
- Mantreswara, Phaladeepika, Chapter 25: alternate ghatika conventions and Upagraha calculation.
- Modern calculators were cross-checked for convention differences:
  - Parasara.net Upagraha Calculator
  - AstroGPT Upagraha Calculator
  - Jagannath Hora Yamakantaka Calculator
See `pages/sources.html`.

## Run locally
Open `index.html` in a browser. For login/database/admin/blog, create a Supabase project and fill `js/config.js`.
