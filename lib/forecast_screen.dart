import 'package:flutter/material.dart';

import 'data.dart';

/// Forecast screen for one location. This is where you work today.
class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tempo Açores')),
      body: ListView(
        children: const [
          IslandHeader(),
          Padding(padding: EdgeInsets.all(16), child: CurrentConditions()),
          DaysRow(),
          Padding(padding: EdgeInsets.all(16), child: DetailCard()),
          IslandsGrid(),
        ],
      ),
    );
  }
}

/// Island photo with a gradient so that text on top of it stays readable.
class IslandHeader extends StatelessWidget {
  const IslandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        fit: StackFit.expand, // children without a position fill the box
        children: [
          Image.asset(currentIsland.image, fit: BoxFit.cover),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black54],
              ),
            ),
          ),
          // TODO 2: add the island name at the bottom left (Positioned) and
          // a Chip with the weather description at the top right.
        ],
      ),
    );
  }
}

/// Location name, current temperature and the min / max / rain row.
class CurrentConditions extends StatelessWidget {
  const CurrentConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final today = forecasts.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // one at each end
          children: [
            // Expanded: a long name wraps instead of pushing the temperature out
            Expanded(child: Text(location, style: textTheme.headlineSmall)),
            Text('${today.tMax.round()} °C', style: textTheme.displaySmall),
          ],
        ),
        const SizedBox(height: 12),
        // Step 1: Expanded gives each value a third of the width, whatever
        // the phone. A fixed width overflows on narrow screens.
        Row(
          children: [
            Expanded(child: _Measure('Mín', '${today.tMin.round()} °C')),
            Expanded(child: _Measure('Máx', '${today.tMax.round()} °C')),
            Expanded(child: _Measure('Chuva', '${today.rainChance} %')),
          ],
        ),
      ],
    );
  }
}

/// A label above a value. Private to this file (leading underscore).
class _Measure extends StatelessWidget {
  const _Measure(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(label, style: textTheme.labelMedium),
        Text(value, style: textTheme.titleMedium),
      ],
    );
  }
}

/// Horizontal row with the five days.
class DaysRow extends StatelessWidget {
  const DaysRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: forecasts.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        // TODO 3: create lib/day_chip.dart with a DayChip widget (a Card with
        // the weekday, the icon and the max temperature) and use it here:
        // itemBuilder: (_, i) => DayChip(forecast: forecasts[i]),
        itemBuilder: (_, i) => SizedBox(
          width: 72,
          child: Card(child: Center(child: Text(forecasts[i].weekday))),
        ),
      ),
    );
  }
}

/// Details of the first day in two columns of rows.
class DetailCard extends StatelessWidget {
  const DetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final f = forecasts.first;
    Widget line(IconData icon, String label, String value) => Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 8),
            Expanded(child: Text(label, style: textTheme.bodyMedium)),
            Text(value, style: textTheme.titleMedium),
          ],
        );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  line(Icons.thermostat, 'Mínima', '${f.tMin.round()} °C'),
                  const SizedBox(height: 8),
                  line(Icons.thermostat, 'Máxima', '${f.tMax.round()} °C'),
                ],
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                children: [
                  line(Icons.air, 'Vento', '${f.windKmh.round()} km/h'),
                  const SizedBox(height: 8),
                  line(Icons.water_drop, 'Chuva', '${f.rainChance} %'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The nine islands in a grid. Already done: read it, we talk about it in
/// the theory part (GridView, shrinkWrap inside a ListView).
///
/// TODO 4 (optional): extract the Card below into lib/island_card.dart as
/// IslandCard(island: i), the same way you did with DayChip.
class IslandsGrid extends StatelessWidget {
  const IslandsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 160, // as many columns as fit, each up to 160 dp
      padding: const EdgeInsets.all(16),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      shrinkWrap: true, // takes only the height it needs, inside the ListView
      physics: const NeverScrollableScrollPhysics(), // the ListView scrolls
      children: [
        for (final i in islands)
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: Image.asset(i.image, fit: BoxFit.cover)),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(i.name, textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
