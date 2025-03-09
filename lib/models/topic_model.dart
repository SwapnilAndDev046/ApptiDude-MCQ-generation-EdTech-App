class SubTopic {
  final String title;
  bool isCompleted;
  String? notes;
  String? problemLink; // Optional field for external problem link

  SubTopic({
    required this.title,
    this.isCompleted = false,
    this.notes,
    this.problemLink,
  });
}

class Topic {
  final String title;
  final int id;
  final List<SubTopic> subTopics;
  bool isExpanded;

  Topic({
    required this.title,
    required this.id,
    required this.subTopics,
    this.isExpanded = false,
  });

  int get completedCount =>
      subTopics.where((subtopic) => subtopic.isCompleted).length;
  int get totalCount => subTopics.length;
  String get progress => '$completedCount/$totalCount items';
}

class TopicCategory {
  final String title;
  final List<Topic> topics;
  bool isExpanded;

  TopicCategory({
    required this.title,
    required this.topics,
    this.isExpanded = false,
  });
}

// Sample data for all categories
List<TopicCategory> getSampleTopicCategories() {
  return [
    // ARITHMETIC APTITUDE-1
    TopicCategory(
      title: 'ARITHMETIC APTITUDE-1',
      topics: [
        // Simplification
        Topic(
          title: 'Simplification',
          id: 1,
          subTopics: [
            SubTopic(
                title: 'Simplification Concepts - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/simplification'),
            SubTopic(
                title: 'Simplification Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_simplification.htm'),
            SubTopic(
                title: 'Simplification Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_simplification_examples.htm'),
            SubTopic(
                title: 'Simplification Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/simplification-1'),
            SubTopic(
                title: 'Simplification Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/simplification-2'),
            SubTopic(
                title: 'Simplification Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/simplification-3'),
            SubTopic(
                title: 'Simplification Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_simplification_quiz.htm'),
          ],
        ),
        // Number Systems
        Topic(
          title: 'Number Systems',
          id: 2,
          subTopics: [
            SubTopic(
                title: 'Number System Concepts - 1',
                problemLink: 'https://www.javatpoint.com/aptitude/numbers'),
            SubTopic(
                title: 'Number System Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_number_system.htm'),
            SubTopic(
                title: 'Number System Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_number_system_examples.htm'),
            SubTopic(
                title: 'Number System Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/aptitude/numbers-1'),
            SubTopic(
                title: 'Number System Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/aptitude/numbers-2'),
            SubTopic(
                title: 'Number System Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/aptitude/numbers-3'),
            SubTopic(
                title: 'Number System Problem Set - 5',
                problemLink: 'https://www.javatpoint.com/aptitude/numbers-4'),
            SubTopic(
                title: 'Number System Problem Set - 6',
                problemLink: 'https://www.javatpoint.com/aptitude/numbers-5'),
            SubTopic(
                title: 'Number System Problem Set - 7',
                problemLink: 'https://www.javatpoint.com/aptitude/numbers-6'),
            SubTopic(
                title: 'Number System Problem Set - 8',
                problemLink: 'https://www.javatpoint.com/aptitude/numbers-7'),
            SubTopic(
                title: 'Number System Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_number_system_quiz.htm'),
          ],
        ),
        // Decimal Fraction
        Topic(
          title: 'Decimal Fraction',
          id: 3,
          subTopics: [
            SubTopic(
                title: 'Decimal Fraction Concepts - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/decimal-fraction'),
            SubTopic(
                title: 'Decimal Fraction Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_decimals.htm'),
            SubTopic(
                title: 'Decimal Fraction Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_decimals_examples.htm'),
            SubTopic(
                title: 'Decimal Fraction Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/decimal-fraction-1'),
            SubTopic(
                title: 'Decimal Fraction Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/decimal-fraction-2'),
            SubTopic(
                title: 'Decimal Fraction Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/decimal-fraction-3'),
            SubTopic(
                title: 'Decimal Fraction Problem Set - 5',
                problemLink:
                    'https://www.javatpoint.com/aptitude/decimal-fraction-4'),
            SubTopic(
                title: 'Decimal Fraction Problem Set - 6',
                problemLink:
                    'https://www.javatpoint.com/aptitude/decimal-fraction-5'),
            SubTopic(
                title: 'Decimal Fraction Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_decimals_quiz.htm'),
          ],
        ),
        // HCF and LCM
        Topic(
          title: 'HCF and LCM',
          id: 4,
          subTopics: [
            SubTopic(
                title: 'HCF and LCM Concepts - 1',
                problemLink: 'https://www.javatpoint.com/aptitude/hcf-and-lcm'),
            SubTopic(
                title: 'HCF and LCM Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_hcf_lcm.htm'),
            SubTopic(
                title: 'HCF and LCM Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_hcf_lcm_examples.htm'),
            SubTopic(
                title: 'HCF and LCM Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/hcf-and-lcm-1'),
            SubTopic(
                title: 'HCF and LCM Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/hcf-and-lcm-2'),
            SubTopic(
                title: 'HCF and LCM Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/hcf-and-lcm-3'),
            SubTopic(
                title: 'HCF and LCM Problem Set - 5',
                problemLink:
                    'https://www.javatpoint.com/aptitude/hcf-and-lcm-4'),
            SubTopic(
                title: 'HCF and LCM Problem Set - 6',
                problemLink:
                    'https://www.javatpoint.com/aptitude/hcf-and-lcm-5'),
            SubTopic(
                title: 'HCF and LCM Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_hcf_lcm_quiz.htm'),
          ],
        ),
        // Surds and Indices
        Topic(
          title: 'Surds and Indices',
          id: 5,
          subTopics: [
            SubTopic(
                title: 'Surds and Indices Concepts',
                problemLink:
                    'https://www.javatpoint.com/aptitude/surds-and-indices'),
            SubTopic(
                title: 'Surds and Indices Problem Set - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/surds-and-indices-1'),
            SubTopic(
                title: 'Surds and Indices Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/surds-and-indices-2'),
            SubTopic(
                title: 'Surds and Indices Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/surds-and-indices-3'),
            SubTopic(
                title: 'Surds and Indices Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/surds-and-indices-4'),
            SubTopic(
                title: 'Surds and Indices Quiz',
                problemLink:
                    'https://www.indiabix.com/aptitude/surds-and-indices/'),
          ],
        ),
        // Percentages
        Topic(
          title: 'Percentages',
          id: 6,
          subTopics: [
            SubTopic(
                title: 'Percentages Concepts - 1',
                problemLink: 'https://www.javatpoint.com/aptitude/percentage'),
            SubTopic(
                title: 'Percentages Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_percentages.htm'),
            SubTopic(
                title: 'Percentages Concepts - 3',
                problemLink:
                    'https://www.naukri.com/code360/guided-paths/aptitude-preparation/content/119114/offering/1463098'),
            SubTopic(
                title: 'Percentages Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_percentages_examples.htm'),
            SubTopic(
                title: 'Percentages Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/percentage-1'),
            SubTopic(
                title: 'Percentages Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/percentage-2'),
            SubTopic(
                title: 'Percentages Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/percentage-3'),
            SubTopic(
                title: 'Percentages Problem Set - 5',
                problemLink:
                    'https://www.javatpoint.com/aptitude/percentage-4'),
            SubTopic(
                title: 'Percentages Problem Set - 6',
                problemLink:
                    'https://www.javatpoint.com/aptitude/percentage-5'),
            SubTopic(
                title: 'Percentages Problem Set - 7',
                problemLink:
                    'https://www.javatpoint.com/aptitude/percentage-6'),
            SubTopic(
                title: 'Percentages Problem Set - 8',
                problemLink:
                    'https://www.javatpoint.com/aptitude/percentage-7'),
            SubTopic(
                title: 'Percentages Problem Set - 9',
                problemLink:
                    'https://www.javatpoint.com/aptitude/percentage-8'),
            SubTopic(
                title: 'Percentages Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_percentages_quiz.htm'),
          ],
        ),
        // Average
        Topic(
          title: 'Average',
          id: 7,
          subTopics: [
            SubTopic(
                title: 'Average Concepts - 1',
                problemLink: 'https://www.javatpoint.com/aptitude/average'),
            SubTopic(
                title: 'Average Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_averages.htm'),
            SubTopic(
                title: 'Average Concepts - 3',
                problemLink:
                    'https://www.naukri.com/code360/guided-paths/aptitude-preparation/content/119114/offering/1463096'),
            SubTopic(
                title: 'Average Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_averages_examples.htm'),
            SubTopic(
                title: 'Average Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/aptitude/average-1'),
            SubTopic(
                title: 'Average Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/aptitude/average-2'),
            SubTopic(
                title: 'Average Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/aptitude/average-3'),
            SubTopic(
                title: 'Average Problem Set - 5',
                problemLink: 'https://www.javatpoint.com/aptitude/average-4'),
            SubTopic(
                title: 'Average Problem Set - 6',
                problemLink: 'https://www.javatpoint.com/aptitude/average-5'),
            SubTopic(
                title: 'Average Problem Set - 7',
                problemLink: 'https://www.javatpoint.com/aptitude/average-6'),
            SubTopic(
                title: 'Average Problem Set - 8',
                problemLink: 'https://www.javatpoint.com/aptitude/average-7'),
            SubTopic(
                title: 'Average Problem Set - 9',
                problemLink: 'https://www.javatpoint.com/aptitude/average-8'),
            SubTopic(
                title: 'Average Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_averages_quiz.htm'),
          ],
        ),
        // Profit and Loss
        Topic(
          title: 'Profit and Loss',
          id: 8,
          subTopics: [
            SubTopic(
                title: 'Profit and Loss Concepts - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/profit-and-loss'),
            SubTopic(
                title: 'Profit and Loss Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_profit_loss.htm'),
            SubTopic(
                title: 'Profit and Loss Concepts - 3',
                problemLink:
                    'https://www.naukri.com/code360/guided-paths/aptitude-preparation/content/120291/offering/1463100'),
            SubTopic(
                title: 'Profit and Loss Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_profit_loss_examples.htm'),
            SubTopic(
                title: 'Profit and Loss Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/profit-and-loss-1'),
            SubTopic(
                title: 'Profit and Loss Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/profit-and-loss-2'),
            SubTopic(
                title: 'Profit and Loss Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/profit-and-loss-3'),
            SubTopic(
                title: 'Profit and Loss Problem Set - 5',
                problemLink:
                    'https://www.javatpoint.com/aptitude/profit-and-loss-4'),
            SubTopic(
                title: 'Profit and Loss Problem Set - 6',
                problemLink:
                    'https://www.javatpoint.com/aptitude/profit-and-loss-5'),
            SubTopic(
                title: 'Profit and Loss Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_profit_loss_quiz.htm'),
          ],
        ),
        // Simple Interest
        Topic(
          title: 'Simple Interest',
          id: 9,
          subTopics: [
            SubTopic(
                title: 'Simple Interest Concepts - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/simple-interest'),
            SubTopic(
                title: 'Simple Interest Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_simple_interest.htm'),
            SubTopic(
                title: 'Simple Interest Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_simple_interest_examples.htm'),
            SubTopic(
                title: 'Simple Interest Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/simple-interest-1'),
            SubTopic(
                title: 'Simple Interest Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/simple-interest-2'),
            SubTopic(
                title: 'Simple Interest Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_simple_interest_quiz.htm'),
          ],
        ),
        // Compound Interest
        Topic(
          title: 'Compound Interest',
          id: 10,
          subTopics: [
            SubTopic(
                title: 'Compound Interest Concepts',
                problemLink:
                    'https://www.javatpoint.com/aptitude/compound-interest-concepts'),
            SubTopic(
                title: 'Compound Interest Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_compound_interest.htm'),
            SubTopic(
                title: 'Compound Interest Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/compound-interest-1'),
            SubTopic(
                title: 'Compound Interest Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/compound-interest-2'),
            SubTopic(
                title: 'Compound Interest Quiz',
                problemLink:
                    'https://www.indiabix.com/aptitude/compound-interest/'),
          ],
        ),
      ],
    ),
    // ARITHMETIC APTITUDE-2
    TopicCategory(
      title: 'ARITHMETIC APTITUDE-2',
      topics: [
        // Ratio and Proportion
        Topic(
          title: 'Ratio and Proportion',
          id: 11,
          subTopics: [
            SubTopic(
                title: 'Ratio and Proportion Concepts - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/ratio-and-proportion'),
            SubTopic(
                title: 'Ratio and Proportion Concepts - 2',
                problemLink:
                    'https://www.naukri.com/code360/guided-paths/aptitude-preparation/content/120291/offering/1463099'),
            SubTopic(
                title: 'Ratio and Proportion Concepts - 3',
                problemLink:
                    'https://www.naukri.com/code360/guided-paths/aptitude-preparation/content/120291/offering/1463102'),
            SubTopic(
                title: 'Ratio and Proportion Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_ratios_examples.htm'),
            SubTopic(
                title: 'Ratio and Proportion Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/ratio-and-proportion-1'),
            SubTopic(
                title: 'Ratio and Proportion Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/ratio-and-proportion-2'),
            SubTopic(
                title: 'Ratio and Proportion Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/ratio-and-proportion-3'),
            SubTopic(
                title: 'Ratio and Proportion Problem Set - 5',
                problemLink:
                    'https://www.javatpoint.com/aptitude/ratio-and-proportion-4'),
            SubTopic(
                title: 'Ratio and Proportion Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_ratios_quiz.htm'),
          ],
        ),
        // Alligation and Mixture
        Topic(
          title: 'Alligation and Mixture',
          id: 12,
          subTopics: [
            SubTopic(
                title: 'Alligation and Mixture Concepts - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/alligation-and-mixture'),
            SubTopic(
                title: 'Alligation and Mixture Concepts - 2',
                problemLink:
                    'https://www.naukri.com/code360/guided-paths/aptitude-preparation/content/119114/offering/1463097'),
            SubTopic(
                title: 'Alligation and Mixture Problem Set - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/alligation-and-mixture-1'),
            SubTopic(
                title: 'Alligation and Mixture Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/alligation-and-mixture-2'),
            SubTopic(
                title: 'Alligation and Mixture Quiz',
                problemLink:
                    'https://www.indiabix.com/aptitude/alligation-or-mixture/'),
          ],
        ),
        // Partnership
        Topic(
          title: 'Partnership',
          id: 13,
          subTopics: [
            SubTopic(
                title: 'Partnership Concepts - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/partnership-concepts'),
            SubTopic(
                title: 'Partnership Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_partnership.htm'),
            SubTopic(
                title: 'Partnership Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_partnership_examples.htm'),
            SubTopic(
                title: 'Partnership Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/partnership-1'),
            SubTopic(
                title: 'Partnership Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/partnership-2'),
            SubTopic(
                title: 'Partnership Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/partnership-3'),
            SubTopic(
                title: 'Partnership Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_partnership_quiz.htm'),
          ],
        ),
        // Ages
        Topic(
          title: 'Ages',
          id: 14,
          subTopics: [
            SubTopic(
                title: 'Ages Concepts',
                problemLink:
                    'https://www.javatpoint.com/aptitude/problem-on-ages'),
            SubTopic(
                title: 'Ages Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_ages_examples.htm'),
            SubTopic(
                title: 'Ages Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/problem-on-ages-1'),
            SubTopic(
                title: 'Ages Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/problem-on-ages-2'),
            SubTopic(
                title: 'Ages Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/problem-on-ages-3'),
            SubTopic(
                title: 'Ages Problem Set - 5',
                problemLink:
                    'https://www.javatpoint.com/aptitude/problem-on-ages-4'),
            SubTopic(
                title: 'Ages Problem Set - 6',
                problemLink:
                    'https://www.javatpoint.com/aptitude/problem-on-ages-5'),
            SubTopic(
                title: 'Ages Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_ages_quiz.htm'),
          ],
        ),
        // Clocks
        Topic(
          title: 'Clocks',
          id: 15,
          subTopics: [
            SubTopic(
                title: 'Clocks Concepts - 1',
                problemLink: 'https://www.javatpoint.com/aptitude/clocks'),
            SubTopic(
                title: 'Clocks Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_clock.htm'),
            SubTopic(
                title: 'Clocks Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_clock_examples.htm'),
            SubTopic(
                title: 'Clocks Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/aptitude/clocks-1'),
            SubTopic(
                title: 'Clocks Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/aptitude/clocks-2'),
            SubTopic(
                title: 'Clocks Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_clock_quiz.htm'),
          ],
        ),
        // Calendar
        Topic(
          title: 'Calendar',
          id: 16,
          subTopics: [
            SubTopic(
                title: 'Calendar Concepts - 1',
                problemLink: 'https://www.javatpoint.com/aptitude/calendar'),
            SubTopic(
                title: 'Calendar Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_calendar.htm'),
            SubTopic(
                title: 'Calendar Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_calendar_examples.htm'),
            SubTopic(
                title: 'Calendar Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/aptitude/calendar-1'),
            SubTopic(
                title: 'Calendar Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/aptitude/calendar-2'),
            SubTopic(
                title: 'Calendar Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_calendar_quiz.htm'),
          ],
        ),
        // Stocks and Shares
        Topic(
          title: 'Stocks and Shares',
          id: 17,
          subTopics: [
            SubTopic(
                title: 'Stocks and Shares Concepts - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/stocks-and-shares'),
            SubTopic(
                title: 'Stocks and Shares Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_stock_market.htm'),
            SubTopic(
                title: 'Stocks and Shares Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_stock_market_examples.htm'),
            SubTopic(
                title: 'Stocks and Shares Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/stocks-and-shares-1'),
            SubTopic(
                title: 'Stocks and Shares Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/stocks-and-shares-2'),
            SubTopic(
                title: 'Stocks and Shares Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/stocks-and-shares-3'),
            SubTopic(
                title: 'Stocks and Shares Problem Set - 5',
                problemLink:
                    'https://www.javatpoint.com/aptitude/stocks-and-shares-4'),
            SubTopic(
                title: 'Stocks and Shares Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_stock_market_quiz.htm'),
          ],
        ),
        // True Discount and Banker's Discount
        Topic(
          title: "True Discount and Banker's Discount",
          id: 18,
          subTopics: [
            SubTopic(
                title: "True Discount and Banker's Discount Concepts - 1",
                problemLink:
                    'https://www.javatpoint.com/aptitude/true-discount-and-banker-discount'),
            SubTopic(
                title: "True Discount and Banker's Discount Concepts - 2",
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_discounts.htm'),
            SubTopic(
                title: "True Discount and Banker's Discount Problem Set - 1",
                problemLink:
                    'https://www.javatpoint.com/aptitude/true-discount-and-banker-discount-1'),
            SubTopic(
                title: "True Discount and Banker's Discount Problem Set - 2",
                problemLink:
                    'https://www.javatpoint.com/aptitude/true-discount-and-banker-discount-2'),
            SubTopic(
                title: "True Discount and Banker's Discount Problem Set - 3",
                problemLink:
                    'https://www.javatpoint.com/aptitude/true-discount-and-banker-discount-3'),
            SubTopic(
                title: "True Discount Quiz",
                problemLink:
                    'https://www.indiabix.com/aptitude/true-discount/'),
            SubTopic(
                title: "Banker's Discount Quiz",
                problemLink:
                    'https://www.indiabix.com/aptitude/bankers-discount/'),
          ],
        ),
        // Races and Games
        Topic(
          title: 'Races and Games',
          id: 19,
          subTopics: [
            SubTopic(
                title: 'Races and Games Concepts - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/races-and-games'),
            SubTopic(
                title: 'Races and Games Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_races_games.htm'),
            SubTopic(
                title: 'Races and Games Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_races_games_examples.htm'),
            SubTopic(
                title: 'Races and Games Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/races-and-games-1'),
            SubTopic(
                title: 'Races and Games Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/races-and-games-2'),
            SubTopic(
                title: 'Races and Games Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/races-and-games-3'),
            SubTopic(
                title: 'Races and Games Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_races_games_quiz.htm'),
          ],
        ),
        // Logarithms
        Topic(
          title: 'Logarithms',
          id: 20,
          subTopics: [
            SubTopic(
                title: 'Logarithm Concepts',
                problemLink: 'https://www.javatpoint.com/aptitude/logarithm'),
            SubTopic(
                title: 'Logarithm Quiz',
                problemLink: 'https://www.indiabix.com/aptitude/logarithm/'),
          ],
        ),
        // Chain Rule
        Topic(
          title: 'Chain Rule',
          id: 21,
          subTopics: [
            SubTopic(
                title: 'Chain Rule Concepts - 1',
                problemLink: 'https://www.javatpoint.com/aptitude/chain-rule'),
            SubTopic(
                title: 'Chain Rule Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_chain_rules.htm'),
            SubTopic(
                title: 'Chain Rule Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_chain_rules_examples.htm'),
            SubTopic(
                title: 'Chain Rule Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/chain-rule-1'),
            SubTopic(
                title: 'Chain Rule Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/chain-rule-2'),
            SubTopic(
                title: 'Chain Rule Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/chain-rule-3'),
            SubTopic(
                title: 'Chain Rule Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_chain_rules_quiz.htm'),
          ],
        ),
      ],
    ),
    // MATHEMATIC APTITUDE
    TopicCategory(
      title: 'MATHEMATIC APTITUDE',
      topics: [
        // Probability
        Topic(
          title: 'Probability',
          id: 22,
          subTopics: [
            SubTopic(
                title: 'Probability Concepts - 1',
                problemLink: 'https://www.javatpoint.com/probability'),
            SubTopic(
                title: 'Probability Concepts - 2',
                problemLink: 'https://www.javatpoint.com/aptitude/probability'),
            SubTopic(
                title: 'Probability Concepts - 3',
                problemLink:
                    'https://www.naukri.com/code360/guided-paths/aptitude-preparation/content/120292/offering/1463105'),
            SubTopic(
                title: 'Probability Problem Set - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/probability-1'),
            SubTopic(
                title: 'Probability Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/probability-2'),
            SubTopic(
                title: 'Probability Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/probability-3'),
            SubTopic(
                title: 'Probability Quiz',
                problemLink: 'https://www.indiabix.com/aptitude/probability/'),
          ],
        ),
        // Permutation and Combination
        Topic(
          title: 'Permutation and Combination',
          id: 23,
          subTopics: [
            SubTopic(
                title: 'Permutation and Combination Concepts - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/permutation-and-combination'),
            SubTopic(
                title: 'Permutation and Combination Concepts - 2',
                problemLink:
                    'https://www.naukri.com/code360/guided-paths/aptitude-preparation/content/120292/offering/1463104'),
            SubTopic(
                title: 'Permutation and Combination Problem Set - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/permutation-and-combination-1'),
            SubTopic(
                title: 'Permutation and Combination Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/permutation-and-combination-2'),
            SubTopic(
                title: 'Permutation and Combination Quiz',
                problemLink:
                    'https://www.indiabix.com/aptitude/permutation-and-combination/'),
          ],
        ),
        // Time and Work
        Topic(
          title: 'Time and Work',
          id: 24,
          subTopics: [
            SubTopic(
                title: 'Time and Work Concepts - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/time-and-work'),
            SubTopic(
                title: 'Time and Work Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_time_work.htm'),
            SubTopic(
                title: 'Time and Work Concepts - 3',
                problemLink:
                    'https://www.naukri.com/code360/guided-paths/aptitude-preparation/content/120291/offering/1463103'),
            SubTopic(
                title: 'Time and Work Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_time_work_examples.htm'),
            SubTopic(
                title: 'Time and Work Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/time-and-work-1'),
            SubTopic(
                title: 'Time and Work Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/time-and-work-2'),
            SubTopic(
                title: 'Time and Work Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/time-and-work-3'),
            SubTopic(
                title: 'Time and Work Problem Set - 5',
                problemLink:
                    'https://www.javatpoint.com/aptitude/time-and-work-4'),
            SubTopic(
                title: 'Time and Work Problem Set - 6',
                problemLink:
                    'https://www.javatpoint.com/aptitude/time-and-work-5'),
            SubTopic(
                title: 'Time and Work Problem Set - 7',
                problemLink:
                    'https://www.javatpoint.com/aptitude/time-and-work-6'),
            SubTopic(
                title: 'Time and Work Problem Set - 8',
                problemLink:
                    'https://www.javatpoint.com/aptitude/time-and-work-7'),
            SubTopic(
                title: 'Time and Work Problem Set - 9',
                problemLink:
                    'https://www.javatpoint.com/aptitude/time-and-work-8'),
            SubTopic(
                title: 'Time and Work Problem Set - 10',
                problemLink:
                    'https://www.javatpoint.com/aptitude/time-and-work-9'),
            SubTopic(
                title: 'Time and Work Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_time_work_quiz.htm'),
          ],
        ),
        // Speed, Time and Distance
        Topic(
          title: 'Speed, Time and Distance',
          id: 25,
          subTopics: [
            SubTopic(
                title: 'Speed, Time and Distance Concepts - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/speed-time-and-distance'),
            SubTopic(
                title: 'Speed, Time and Distance Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_speed_distance.htm'),
            SubTopic(
                title: 'Speed, Time and Distance Concepts - 3',
                problemLink:
                    'https://www.naukri.com/code360/guided-paths/aptitude-preparation/content/120292/offering/1463107'),
            SubTopic(
                title: 'Speed, Time and Distance Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_speed_distance_examples.htm'),
            SubTopic(
                title: 'Speed, Time and Distance Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/speed-time-and-distance-1'),
            SubTopic(
                title: 'Speed, Time and Distance Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/speed-time-and-distance-2'),
            SubTopic(
                title: 'Speed, Time and Distance Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/speed-time-and-distance-3'),
            SubTopic(
                title: 'Speed, Time and Distance Problem Set - 5',
                problemLink:
                    'https://www.javatpoint.com/aptitude/speed-time-and-distance-4'),
            SubTopic(
                title: 'Speed, Time and Distance Problem Set - 6',
                problemLink:
                    'https://www.javatpoint.com/aptitude/speed-time-and-distance-5'),
            SubTopic(
                title: 'Speed, Time and Distance Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_speed_distance_quiz.htm'),
          ],
        ),
        // Train Problems
        Topic(
          title: 'Train Problems',
          id: 26,
          subTopics: [
            SubTopic(
                title: 'Trains Concepts - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/problem-on-trains'),
            SubTopic(
                title: 'Trains Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_trains.htm'),
            SubTopic(
                title: 'Trains Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_trains_examples.htm'),
            SubTopic(
                title: 'Trains Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/problem-on-trains-1'),
            SubTopic(
                title: 'Trains Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/problem-on-trains-2'),
            SubTopic(
                title: 'Trains Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/problem-on-trains-3'),
            SubTopic(
                title: 'Trains Problem Set - 5',
                problemLink:
                    'https://www.javatpoint.com/aptitude/problem-on-trains-4'),
            SubTopic(
                title: 'Trains Problem Set - 6',
                problemLink:
                    'https://www.javatpoint.com/aptitude/problem-on-trains-5'),
            SubTopic(
                title: 'Trains Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_trains_quiz.htm'),
          ],
        ),
        // Height and Distance
        Topic(
          title: 'Height and Distance',
          id: 27,
          subTopics: [
            SubTopic(
                title: 'Height and Distance Concepts - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/height-and-distance'),
            SubTopic(
                title: 'Height and Distance Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_height_distance.htm'),
            SubTopic(
                title: 'Height and Distance Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_height_distance_examples.htm'),
            SubTopic(
                title: 'Height and Distance Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/height-and-distance-1'),
            SubTopic(
                title: 'Height and Distance Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_height_distance_quiz.htm'),
          ],
        ),
        // Boat and Streams
        Topic(
          title: 'Boat and Streams',
          id: 28,
          subTopics: [
            SubTopic(
                title: 'Boat and Streams Concepts - 1',
                problemLink:
                    'https://javatpoint.com/aptitude/boats-and-streams'),
            SubTopic(
                title: 'Boat and Streams Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_boats_streams.htm'),
            SubTopic(
                title: 'Boat and Streams Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_boats_streams_examples.htm'),
            SubTopic(
                title: 'Boat and Streams Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/boats-and-streams-1'),
            SubTopic(
                title: 'Boat and Streams Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/boats-and-streams-2'),
            SubTopic(
                title: 'Boat and Streams Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/boats-and-streams-3'),
            SubTopic(
                title: 'Boat and Streams Problem Set - 5',
                problemLink:
                    'https://www.javatpoint.com/aptitude/boats-and-streams-4'),
            SubTopic(
                title: 'Boat and Streams Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_boats_streams_quiz.htm'),
          ],
        ),
        // Pipes and Cisterns
        Topic(
          title: 'Pipes and Cisterns',
          id: 29,
          subTopics: [
            SubTopic(
                title: 'Pipes and Cisterns Concepts - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/pipes-and-cisterns'),
            SubTopic(
                title: 'Pipes and Cisterns Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_pipes_cisterns.htm'),
            SubTopic(
                title: 'Pipes and Cisterns Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_pipes_cisterns_examples.htm'),
            SubTopic(
                title: 'Pipes and Cisterns Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/pipes-and-cisterns-1'),
            SubTopic(
                title: 'Pipes and Cisterns Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/pipes-and-cisterns-2'),
            SubTopic(
                title: 'Pipes and Cisterns Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/pipes-and-cisterns-3'),
            SubTopic(
                title: 'Pipes and Cisterns Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_pipes_cisterns_quiz.htm'),
          ],
        ),
      ],
    ),
    // MENSURATION AND GEOMETRY
    TopicCategory(
      title: 'MENSURATION AND GEOMETRY',
      topics: [
        // Area
        Topic(
          title: 'Area',
          id: 30,
          subTopics: [
            SubTopic(
                title: 'Area Concepts - 1',
                problemLink: 'https://www.javatpoint.com/aptitude/area'),
            SubTopic(
                title: 'Area Concepts - 2',
                problemLink: 'https://www.tutorialspoint.com/area'),
            SubTopic(
                title: 'Area Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_area_calculation_examples.htm'),
            SubTopic(
                title: 'Area Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/aptitude/area-1'),
            SubTopic(
                title: 'Area Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/aptitude/area-2'),
            SubTopic(
                title: 'Area Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/aptitude/area-3'),
            SubTopic(
                title: 'Area Problem Set - 5',
                problemLink: 'https://www.javatpoint.com/aptitude/area-4'),
            SubTopic(
                title: 'Area Problem Set - 6',
                problemLink: 'https://www.javatpoint.com/aptitude/area-5'),
            SubTopic(
                title: 'Area Problem Set - 7',
                problemLink: 'https://www.javatpoint.com/aptitude/area-6'),
            SubTopic(
                title: 'Area Problem Set - 8',
                problemLink: 'https://www.javatpoint.com/aptitude/area-7'),
            SubTopic(
                title: 'Area Problem Set - 9',
                problemLink: 'https://www.javatpoint.com/aptitude/area-8'),
            SubTopic(
                title: 'Area Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_area_calculation_quiz.htm'),
          ],
        ),
        // Volume and Surface Area
        Topic(
          title: 'Volume and Surface Area',
          id: 31,
          subTopics: [
            SubTopic(
                title: 'Volume and Surface Area Concepts - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/volume-and-surface-area'),
            SubTopic(
                title: 'Volume and Surface Area Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_volume_calculation.htm'),
            SubTopic(
                title: 'Volume and Surface Area Problem Set - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_volume_calculation_examples.htm'),
            SubTopic(
                title: 'Volume and Surface Area Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/volume-and-surface-area-1'),
            SubTopic(
                title: 'Volume and Surface Area Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/volume-and-surface-area-2'),
            SubTopic(
                title: 'Volume and Surface Area Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/volume-and-surface-area-3'),
            SubTopic(
                title: 'Volume and Surface Area Problem Set - 5',
                problemLink:
                    'https://www.javatpoint.com/aptitude/volume-and-surface-area-4'),
            SubTopic(
                title: 'Volume and Surface Area Problem Set - 6',
                problemLink:
                    'https://www.javatpoint.com/aptitude/volume-and-surface-area-5'),
            SubTopic(
                title: 'Volume and Surface Area Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_volume_calculation_quiz.htm'),
          ],
        ),
        // Geometry
        Topic(
          title: 'Geometry',
          id: 32,
          subTopics: [
            SubTopic(
                title: 'Geometry Concepts',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_geometry.htm'),
            SubTopic(
                title: 'Geometry Problems',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_geometry_examples.htm'),
            SubTopic(
                title: 'Geometry Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_geometry_quiz.htm'),
          ],
        ),
        // Coordinate Geometry
        Topic(
          title: 'Coordinate Geometry',
          id: 33,
          subTopics: [
            SubTopic(
                title: 'Coordinate Geometry Concepts',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_coordinate_geometry.htm'),
            SubTopic(
                title: 'Coordinate Geometry Problems',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_coordinate_geometry_examples.htm'),
            SubTopic(
                title: 'Coordinate Geometry Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_coordinate_geometry_quiz.htm'),
          ],
        ),
        // Algebraic Expressions
        Topic(
          title: 'Algebraic Expressions',
          id: 34,
          subTopics: [
            SubTopic(
                title: 'Algebraic Expressions Concepts',
                problemLink:
                    'https://www.javatpoint.com/aptitude/algebraic-expressions'),
            SubTopic(
                title: 'Algebraic Expressions Problem Set - 1',
                problemLink:
                    'https://www.javatpoint.com/aptitude/algebraic-expressions-1'),
            SubTopic(
                title: 'Algebraic Expressions Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/aptitude/algebraic-expressions-2'),
            SubTopic(
                title: 'Algebraic Expressions Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/aptitude/algebraic-expressions-3'),
            SubTopic(
                title: 'Algebraic Expressions Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/aptitude/algebraic-expressions-4'),
          ],
        ),
        // Linear Equations
        Topic(
          title: 'Linear Equations',
          id: 35,
          subTopics: [
            SubTopic(
                title: 'Linear Equation Concepts',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_basic_equations.htm'),
            SubTopic(
                title: 'Linear Equation Problems',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_basic_equations_examples.htm'),
            SubTopic(
                title: 'Linear Equation Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_basic_equations_quiz.htm'),
          ],
        ),
      ],
    ),
    // DATA INTERPRETATION
    TopicCategory(
      title: 'DATA INTERPRETATION',
      topics: [
        // Table Chart
        Topic(
          title: 'Table Chart',
          id: 36,
          subTopics: [
            SubTopic(
                title: 'Table Chart Concepts',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_tables.htm'),
            SubTopic(
                title: 'Table Chart Problems',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_tables_examples.htm'),
            SubTopic(
                title: 'Table Chart Quiz - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_tables_quiz.htm'),
            SubTopic(
                title: 'Table Chart Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/table-charts/'),
            SubTopic(
                title: 'Table Chart Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/table-charts/033001'),
            SubTopic(
                title: 'Table Chart Quiz - 4',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/table-charts/034001'),
            SubTopic(
                title: 'Table Chart Quiz - 5',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/table-charts/035001'),
            SubTopic(
                title: 'Table Chart Quiz - 6',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/table-charts/036001'),
            SubTopic(
                title: 'Table Chart Quiz - 7',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/table-charts/037001'),
            SubTopic(
                title: 'Table Chart Quiz - 8',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/table-charts/038001'),
            SubTopic(
                title: 'Table Chart Quiz - 9',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/table-charts/039001'),
            SubTopic(
                title: 'Table Chart Quiz - 10',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/table-charts/040001'),
          ],
        ),
        // Bar Chart
        Topic(
          title: 'Bar Chart',
          id: 37,
          subTopics: [
            SubTopic(
                title: 'Bar Chart Concepts',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_bar_charts.htm'),
            SubTopic(
                title: 'Bar Chart Problems',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_bar_charts_examples.htm'),
            SubTopic(
                title: 'Bar Chart Quiz - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_bar_charts_quiz.htm'),
            SubTopic(
                title: 'Bar Chart Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/'),
            SubTopic(
                title: 'Bar Chart Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/042001'),
            SubTopic(
                title: 'Bar Chart Quiz - 4',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/043001'),
            SubTopic(
                title: 'Bar Chart Quiz - 5',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/044001'),
            SubTopic(
                title: 'Bar Chart Quiz - 6',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/045001'),
            SubTopic(
                title: 'Bar Chart Quiz - 7',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/046001'),
            SubTopic(
                title: 'Bar Chart Quiz - 8',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/047001'),
            SubTopic(
                title: 'Bar Chart Quiz - 9',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/048001'),
            SubTopic(
                title: 'Bar Chart Quiz - 10',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/049001'),
            SubTopic(
                title: 'Bar Chart Quiz - 11',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/050001'),
            SubTopic(
                title: 'Bar Chart Quiz - 12',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/001001'),
            SubTopic(
                title: 'Bar Chart Quiz - 13',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/002001'),
            SubTopic(
                title: 'Bar Chart Quiz - 14',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/003001'),
            SubTopic(
                title: 'Bar Chart Quiz - 15',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/004001'),
            SubTopic(
                title: 'Bar Chart Quiz - 16',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/005001'),
            SubTopic(
                title: 'Bar Chart Quiz - 17',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/006001'),
            SubTopic(
                title: 'Bar Chart Quiz - 18',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/007001'),
            SubTopic(
                title: 'Bar Chart Quiz - 19',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/008001'),
            SubTopic(
                title: 'Bar Chart Quiz - 20',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/bar-charts/009001'),
          ],
        ),
        // Line Chart
        Topic(
          title: 'Line Chart',
          id: 38,
          subTopics: [
            SubTopic(
                title: 'Line Chart Concepts',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_line_charts.htm'),
            SubTopic(
                title: 'Line Chart Problems',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_line_charts_examples.htm'),
            SubTopic(
                title: 'Line Chart Quiz - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_line_charts_quiz.htm'),
            SubTopic(
                title: 'Line Chart Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/line-charts/'),
            SubTopic(
                title: 'Line Chart Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/line-charts/023001'),
            SubTopic(
                title: 'Line Chart Quiz - 4',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/line-charts/024001'),
            SubTopic(
                title: 'Line Chart Quiz - 5',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/line-charts/025001'),
            SubTopic(
                title: 'Line Chart Quiz - 6',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/line-charts/026001'),
            SubTopic(
                title: 'Line Chart Quiz - 7',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/line-charts/027001'),
            SubTopic(
                title: 'Line Chart Quiz - 8',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/line-charts/028001'),
            SubTopic(
                title: 'Line Chart Quiz - 9',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/line-charts/029001'),
            SubTopic(
                title: 'Line Chart Quiz - 10',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/line-charts/030001'),
            SubTopic(
                title: 'Line Chart Quiz - 11',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/line-charts/031001'),
          ],
        ),
        // Pie Chart
        Topic(
          title: 'Pie Chart',
          id: 39,
          subTopics: [
            SubTopic(
                title: 'Pie Chart Concepts',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_pie_charts.htm'),
            SubTopic(
                title: 'Pie Chart Problem',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_pie_charts_examples.htm'),
            SubTopic(
                title: 'Pie Chart Quiz - 1',
                problemLink:
                    'https://www.tutorialspoint.com/quantitative_aptitude/aptitude_pie_charts_quiz.htm'),
            SubTopic(
                title: 'Pie Chart Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/pie-charts/'),
            SubTopic(
                title: 'Pie Chart Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/pie-charts/011001'),
            SubTopic(
                title: 'Pie Chart Quiz - 4',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/pie-charts/012001'),
            SubTopic(
                title: 'Pie Chart Quiz - 5',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/pie-charts/013001'),
            SubTopic(
                title: 'Pie Chart Quiz - 6',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/pie-charts/014001'),
            SubTopic(
                title: 'Pie Chart Quiz - 7',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/pie-charts/015001'),
            SubTopic(
                title: 'Pie Chart Quiz - 8',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/pie-charts/016001'),
            SubTopic(
                title: 'Pie Chart Quiz - 9',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/pie-charts/017001'),
            SubTopic(
                title: 'Pie Chart Quiz - 10',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/pie-charts/018001'),
            SubTopic(
                title: 'Pie Chart Quiz - 11',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/pie-charts/019001'),
            SubTopic(
                title: 'Pie Chart Quiz - 12',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/pie-charts/020001'),
            SubTopic(
                title: 'Pie Chart Quiz - 13',
                problemLink:
                    'https://www.indiabix.com/data-interpretation/pie-charts/021001'),
          ],
        ),
        // Advanced Data Interpretation
        Topic(
          title: 'Advanced Data Interpretation',
          id: 40,
          subTopics: [
            SubTopic(
                title: 'Advanced Data Interpretation Problems',
                problemLink:
                    'https://www.javatpoint.com/data-interpretation-questions'),
          ],
        ),
      ],
    ),
    // VERBAL REASONING -1
    TopicCategory(
      title: 'VERBAL REASONING -1',
      topics: [
        // Number Series
        Topic(
          title: 'Number Series',
          id: 41,
          subTopics: [
            SubTopic(
                title: 'Number Series Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/number-series-1'),
            SubTopic(
                title: 'Number Series Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/number-series-2'),
            SubTopic(
                title: 'Number Series Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/number-series-3'),
            SubTopic(
                title: 'Number Series Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/number-series-4'),
            SubTopic(
                title: 'Number Series Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/number-series/'),
            SubTopic(
                title: 'Number Series Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/number-series/002001'),
            SubTopic(
                title: 'Number Series Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/number-series/003001'),
            SubTopic(
                title: 'Number Series Quiz - 4',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/number-series/004001'),
          ],
        ),
        // Letter & Symbol Series
        Topic(
          title: 'Letter & Symbol Series',
          id: 42,
          subTopics: [
            SubTopic(
                title: 'Letter & Symbol Series Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/letter-series-1'),
            SubTopic(
                title: 'Letter & Symbol Series Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/letter-series-2'),
            SubTopic(
                title: 'Letter & Symbol Series Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/letter-and-symbol-series/'),
            SubTopic(
                title: 'Letter & Symbol Series Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/letter-and-symbol-series/006001'),
          ],
        ),
        // Logical Sequence of Words
        Topic(
          title: 'Logical Sequence of Words',
          id: 43,
          subTopics: [
            SubTopic(
                title: 'Logical Sequence of Words Problem Set - 1',
                problemLink:
                    'https://www.javatpoint.com/logical-sequence-of-words-1'),
            SubTopic(
                title: 'Logical Sequence of Words Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/logical-sequence-of-words-2'),
            SubTopic(
                title: 'Logical Sequence of Words Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/logical-sequence-of-words-3'),
            SubTopic(
                title: 'Logical Sequence of Words Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/logical-sequence-of-words-4'),
            SubTopic(
                title: 'Logical Sequence of Words Quiz',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/logical-sequence-of-words/'),
          ],
        ),
        // Blood Relations
        Topic(
          title: 'Blood Relations',
          id: 44,
          subTopics: [
            SubTopic(
                title: 'Blood Relations Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/blood-relations-1'),
            SubTopic(
                title: 'Blood Relations Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/blood-relations-2'),
            SubTopic(
                title: 'Blood Relations Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/blood-relations-3'),
            SubTopic(
                title: 'Blood Relations Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/blood-relations-4'),
            SubTopic(
                title: 'Blood Relations Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/blood-relation-test/'),
            SubTopic(
                title: 'Blood Relations Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/blood-relation-test/007001'),
            SubTopic(
                title: 'Blood Relations Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/blood-relation-test/008001'),
          ],
        ),
        // Syllogism
        Topic(
          title: 'Syllogism',
          id: 45,
          subTopics: [
            SubTopic(
                title: 'Syllogism Concepts',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/syllogism/introduction'),
            SubTopic(
                title: 'Syllogism Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/syllogism-1'),
            SubTopic(
                title: 'Syllogism Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/syllogism-2'),
            SubTopic(
                title: 'Syllogism Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/syllogism-3'),
            SubTopic(
                title: 'Syllogism Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/syllogism-4'),
            SubTopic(
                title: 'Syllogism Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/syllogism/'),
            SubTopic(
                title: 'Syllogism Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/syllogism/010001'),
            SubTopic(
                title: 'Syllogism Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/syllogism/011001'),
          ],
        ),
        // Cause and Effect
        Topic(
          title: 'Cause and Effect',
          id: 46,
          subTopics: [
            SubTopic(
                title: 'Cause and Effect Concepts',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/cause-and-effect/introduction'),
            SubTopic(
                title: 'Cause and Effect Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/cause-and-effect-1'),
            SubTopic(
                title: 'Cause and Effect Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/cause-and-effect-2'),
            SubTopic(
                title: 'Cause and Effect Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/cause-and-effect-3'),
            SubTopic(
                title: 'Cause and Effect Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/cause-and-effect-4'),
            SubTopic(
                title: 'Cause and Effect Quiz',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/cause-and-effect/'),
          ],
        ),
        // Dice
        Topic(
          title: 'Dice',
          id: 47,
          subTopics: [
            SubTopic(
                title: 'Dice Concepts',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/dice/introduction'),
            SubTopic(
                title: 'Dice Quiz - 1',
                problemLink: 'https://www.indiabix.com/verbal-reasoning/dice/'),
            SubTopic(
                title: 'Dice Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/dice/014001'),
            SubTopic(
                title: 'Dice Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/dice/015001'),
          ],
        ),
        // Data Sufficiency
        Topic(
          title: 'Data Sufficiency',
          id: 48,
          subTopics: [
            SubTopic(
                title: 'Data Sufficiency Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/data-sufficiency-1'),
            SubTopic(
                title: 'Data Sufficiency Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/data-sufficiency-2'),
            SubTopic(
                title: 'Data Sufficiency Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/data-sufficiency-3'),
            SubTopic(
                title: 'Data Sufficiency Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/data-sufficiency-4'),
            SubTopic(
                title: 'Data Sufficiency Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/data-sufficiency/'),
            SubTopic(
                title: 'Data Sufficiency Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/data-sufficiency/068001'),
            SubTopic(
                title: 'Data Sufficiency Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/data-sufficiency/069001'),
          ],
        ),
        // Truth Verification
        Topic(
          title: 'Truth Verification',
          id: 49,
          subTopics: [
            SubTopic(
                title: 'Truth Verification Problem Set - 1',
                problemLink:
                    'https://www.javatpoint.com/verification-of-the-truth-of-the-statement-1'),
            SubTopic(
                title: 'Truth Verification Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/verification-of-the-truth-of-the-statement-2'),
            SubTopic(
                title: 'Truth Verification Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/verification-of-the-truth-of-the-statement-3'),
            SubTopic(
                title: 'Truth Verification Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/verification-of-the-truth-of-the-statement-4'),
            SubTopic(
                title: 'Truth Verification Problem Set - 5',
                problemLink:
                    'https://www.javatpoint.com/verification-of-the-truth-of-the-statement-5'),
            SubTopic(
                title: 'Truth Verification Quiz',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/verification-of-truth/'),
          ],
        ),
        // Coding and Decoding
        Topic(
          title: 'Coding and Decoding',
          id: 50,
          subTopics: [
            SubTopic(
                title: 'Coding and Decoding Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/coding-decoding-1'),
            SubTopic(
                title: 'Coding and Decoding Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/coding-decoding-2'),
            SubTopic(
                title: 'Coding and Decoding Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/coding-decoding-3'),
            SubTopic(
                title: 'Coding and Decoding Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/coding-decoding-4'),
          ],
        ),
        // Venn Diagram
        Topic(
          title: 'Venn Diagram',
          id: 51,
          subTopics: [
            SubTopic(
                title: 'Venn Diagram Concepts',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/venn-diagrams/introduction'),
            SubTopic(
                title: 'Venn Diagram Problem Set - 1',
                problemLink:
                    'https://www.javatpoint.com/logical-venn-diagrams-1'),
            SubTopic(
                title: 'Venn Diagram Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/logical-venn-diagrams-2'),
            SubTopic(
                title: 'Venn Diagram Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/logical-venn-diagrams-3'),
            SubTopic(
                title: 'Venn Diagram Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/logical-venn-diagrams-4'),
            SubTopic(
                title: 'Venn Diagram Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/venn-diagrams/023001'),
            SubTopic(
                title: 'Venn Diagram Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/venn-diagrams/024001'),
          ],
        ),
        // Analogy
        Topic(
          title: 'Analogy',
          id: 52,
          subTopics: [
            SubTopic(
                title: 'Analogy Problem Set - 1',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/analogy/introduction'),
            SubTopic(
                title: 'Analogy Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/analogies-1'),
            SubTopic(
                title: 'Analogy Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/analogies-2'),
            SubTopic(
                title: 'Analogy Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/analogies-3'),
            SubTopic(
                title: 'Analogy Problem Set - 5',
                problemLink: 'https://www.javatpoint.com/analogies-4'),
            SubTopic(
                title: 'Analogy Problem Set - 6',
                problemLink: 'https://www.javatpoint.com/analogies-5'),
            SubTopic(
                title: 'Analogy Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/analogy/040001'),
            SubTopic(
                title: 'Analogy Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/analogy/038001'),
          ],
        ),
        // Seating Arrangement
        Topic(
          title: 'Seating Arrangement',
          id: 53,
          subTopics: [
            SubTopic(
                title: 'Seating Arrangement Concepts - 1',
                problemLink:
                    'https://www.tutorialspoint.com/reasoning/reasoning_seating_arrangement.htm'),
            SubTopic(
                title: 'Seating Arrangement Concepts - 2',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/seating-arrangement/introduction'),
            SubTopic(
                title: 'Seating Arrangement Problems',
                problemLink:
                    'https://www.tutorialspoint.com/reasoning/reasoning_seating_arrangement_examples.htm'),
            SubTopic(
                title: 'Seating Arrangement Quiz - 1',
                problemLink:
                    'https://www.tutorialspoint.com/reasoning/reasoning_seating_arrangement_online_quiz.htm'),
            SubTopic(
                title: 'Seating Arrangement Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/seating-arrangement/'),
            SubTopic(
                title: 'Seating Arrangement Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/seating-arrangement/042001'),
            SubTopic(
                title: 'Seating Arrangement Quiz - 4',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/seating-arrangement/043001'),
            SubTopic(
                title: 'Seating Arrangement Quiz - 5',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/seating-arrangement/044001'),
            SubTopic(
                title: 'Seating Arrangement Quiz - 6',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/seating-arrangement/045001'),
            SubTopic(
                title: 'Seating Arrangement Quiz - 7',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/seating-arrangement/046001'),
            SubTopic(
                title: 'Seating Arrangement Quiz - 8',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/seating-arrangement/047001'),
            SubTopic(
                title: 'Seating Arrangement Quiz - 9',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/seating-arrangement/048001'),
            SubTopic(
                title: 'Seating Arrangement Quiz - 10',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/seating-arrangement/049001'),
            SubTopic(
                title: 'Seating Arrangement Quiz - 11',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/seating-arrangement/050001'),
          ],
        ),
      ],
    ),
    // VERBAL REASONING -2
    TopicCategory(
      title: 'VERBAL REASONING -2',
      topics: [
        // Sense of Direction
        Topic(
          title: 'Sense of Direction',
          id: 54,
          subTopics: [
            SubTopic(
                title: 'Sense of Direction Concepts',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/direction-sense-test/introduction'),
            SubTopic(
                title: 'Sense of Direction Problem Set - 1',
                problemLink:
                    'https://www.javatpoint.com/direction-sense-test-1'),
            SubTopic(
                title: 'Sense of Direction Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/direction-sense-test-2'),
            SubTopic(
                title: 'Sense of Direction Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/direction-sense-test-3'),
            SubTopic(
                title: 'Sense of Direction Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/direction-sense-test-4'),
            SubTopic(
                title: 'Sense of Direction Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/direction-sense-test/'),
            SubTopic(
                title: 'Sense of Direction Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/direction-sense-test/002001'),
            SubTopic(
                title: 'Sense of Direction Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/direction-sense-test/003001'),
            SubTopic(
                title: 'Sense of Direction Quiz - 4',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/direction-sense-test/004001'),
            SubTopic(
                title: 'Sense of Direction Quiz - 5',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/direction-sense-test/005001'),
          ],
        ),
        // Cube and Cuboid
        Topic(
          title: 'Cube and Cuboid',
          id: 55,
          subTopics: [
            SubTopic(
                title: 'Cube and Cuboid Concepts - 1',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/cube-and-cuboid/introduction'),
            SubTopic(
                title: 'Cube and Cuboid Concepts - 2',
                problemLink:
                    'https://www.tutorialspoint.com/reasoning/reasoning_cube_and_cuboid.htm'),
            SubTopic(
                title: 'Cube and Cuboid Problems',
                problemLink:
                    'https://www.tutorialspoint.com/reasoning/reasoning_cube_and_cuboid_examples.htm'),
            SubTopic(
                title: 'Cube and Cuboid Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/cube-and-cuboid/'),
            SubTopic(
                title: 'Cube and Cuboid Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/cube-and-cuboid/027001'),
            SubTopic(
                title: 'Cube and Cuboid Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/cube-and-cuboid/028001'),
            SubTopic(
                title: 'Cube and Cuboid Quiz - 4',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/cube-and-cuboid/029001'),
            SubTopic(
                title: 'Cube and Cuboid Quiz - 5',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/cube-and-cuboid/030001'),
            SubTopic(
                title: 'Cube and Cuboid Quiz - 6',
                problemLink:
                    'https://www.tutorialspoint.com/reasoning/reasoning_cube_and_cuboid_online_quiz.htm'),
          ],
        ),
        // Verbal Classification
        Topic(
          title: 'Verbal Classification',
          id: 56,
          subTopics: [
            SubTopic(
                title: 'Verbal Classification Problem Set - 1',
                problemLink:
                    'https://www.javatpoint.com/verbal-classification-1'),
            SubTopic(
                title: 'Verbal Classification Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/verbal-classification-2'),
            SubTopic(
                title: 'Verbal Classification Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/verbal-classification-3'),
            SubTopic(
                title: 'Verbal Classification Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/verbal-classification-4'),
            SubTopic(
                title: 'Verbal Classification Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/classification/063001'),
            SubTopic(
                title: 'Verbal Classification Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/classification/064001'),
            SubTopic(
                title: 'Verbal Classification Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/classification/065001'),
            SubTopic(
                title: 'Verbal Classification Quiz - 4',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/classification/059001'),
            SubTopic(
                title: 'Verbal Classification Quiz - 5',
                problemLink:
                    'https://www.indiabix.com/verbal-reasoning/classification/057001'),
          ],
        ),
        // Assertion and Reason
        Topic(
          title: 'Assertion and Reason',
          id: 57,
          subTopics: [
            SubTopic(
                title: 'Assertion and Reason Problem Set - 1',
                problemLink:
                    'https://www.javatpoint.com/assertion-and-reason-1'),
            SubTopic(
                title: 'Assertion and Reason Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/assertion-and-reason-2'),
            SubTopic(
                title: 'Assertion and Reason Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/assertion-and-reason-3'),
            SubTopic(
                title: 'Assertion and Reason Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/assertion-and-reason-4'),
          ],
        ),
        // Course of Action
        Topic(
          title: 'Course of Action',
          id: 58,
          subTopics: [
            SubTopic(
                title: 'Course of Action Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/course-of-action-1'),
            SubTopic(
                title: 'Course of Action Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/course-of-action-2'),
            SubTopic(
                title: 'Course of Action Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/course-of-action-3'),
            SubTopic(
                title: 'Course of Action Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/course-of-action-4'),
            SubTopic(
                title: 'Course of Action Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/course-of-action/'),
            SubTopic(
                title: 'Course of Action Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/course-of-action/048001'),
            SubTopic(
                title: 'Course of Action Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/course-of-action/053001'),
          ],
        ),
        // Theme Detection
        Topic(
          title: 'Theme Detection',
          id: 59,
          subTopics: [
            SubTopic(
                title: 'Theme Detection Concepts',
                problemLink:
                    'https://www.tutorialspoint.com/reasoning/reasoning_theme_detection.htm'),
            SubTopic(
                title: 'Theme Detection Problems',
                problemLink:
                    'https://www.tutorialspoint.com/reasoning/reasoning_theme_detection_examples.htm'),
            SubTopic(
                title: 'Theme Detection Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/theme-detection/'),
            SubTopic(
                title: 'Theme Detection Quiz - 2',
                problemLink:
                    'https://www.tutorialspoint.com/reasoning/reasoning_theme_detection_online_quiz.htm'),
          ],
        ),
        // Logical Deduction
        Topic(
          title: 'Logical Deduction',
          id: 60,
          subTopics: [
            SubTopic(
                title: 'Logical Deduction Concepts',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/logical-deduction/introduction'),
            SubTopic(
                title: 'Logical Deduction Formulas',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/logical-deduction/formulas'),
            SubTopic(
                title: 'Logical Deduction Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/logical-problems-1'),
            SubTopic(
                title: 'Logical Deduction Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/logical-problems-2'),
            SubTopic(
                title: 'Logical Deduction Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/logical-problems-3'),
            SubTopic(
                title: 'Logical Deduction Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/logical-deduction/'),
            SubTopic(
                title: 'Logical Deduction Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/logical-deduction/052001'),
            SubTopic(
                title: 'Logical Deduction Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/logical-deduction/057001'),
            SubTopic(
                title: 'Logical Deduction Quiz - 4',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/logical-deduction/058001'),
          ],
        ),
        // Artificial Language
        Topic(
          title: 'Artificial Language',
          id: 61,
          subTopics: [
            SubTopic(
                title: 'Artificial Language Concepts',
                problemLink:
                    'https://www.tutorialspoint.com/reasoning/reasoning_artificial_language.htm'),
            SubTopic(
                title: 'Artificial Language Problems',
                problemLink:
                    'https://www.tutorialspoint.com/reasoning/reasoning_artificial_language_examples.htm'),
            SubTopic(
                title: 'Artificial Language Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/artificial-language/'),
            SubTopic(
                title: 'Artificial Language Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/artificial-language/019001'),
          ],
        ),
        // Matching Definitions
        Topic(
          title: 'Matching Definitions',
          id: 62,
          subTopics: [
            SubTopic(
                title: 'Matching Definitions Problem Set - 1',
                problemLink:
                    'https://www.javatpoint.com/matching-definitions-1'),
            SubTopic(
                title: 'Matching Definitions Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/matching-definitions-2'),
            SubTopic(
                title: 'Matching Definitions Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/matching-definitions-3'),
            SubTopic(
                title: 'Matching Definitions Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/matching-definitions-4'),
            SubTopic(
                title: 'Matching Definitions Problem Set - 5',
                problemLink:
                    'https://www.javatpoint.com/matching-definitions-5'),
            SubTopic(
                title: 'Matching Definitions Quiz',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/matching-definitions/'),
          ],
        ),
        // Logical Games
        Topic(
          title: 'Logical Games',
          id: 63,
          subTopics: [
            SubTopic(
                title: 'Logical Games Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/logical-games/'),
            SubTopic(
                title: 'Logical Games Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/logical-games/029001'),
            SubTopic(
                title: 'Logical Games Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/logical-games/030001'),
            SubTopic(
                title: 'Logical Games Quiz - 4',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/logical-games/031001'),
          ],
        ),
        // Essential Part
        Topic(
          title: 'Essential Part',
          id: 64,
          subTopics: [
            SubTopic(
                title: 'Essential Part Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/essential-part-1'),
            SubTopic(
                title: 'Essential Part Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/essential-part-2'),
            SubTopic(
                title: 'Essential Part Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/essential-part-3'),
            SubTopic(
                title: 'Essential Part Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/essential-part-4'),
            SubTopic(
                title: 'Essential Part Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/essential-part/'),
            SubTopic(
                title: 'Essential Part Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/essential-part/010001'),
            SubTopic(
                title: 'Essential Part Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/logical-reasoning/essential-part/011001'),
          ],
        ),
      ],
    ),
    // NON VERBAL REASONING -1
    TopicCategory(
      title: 'NON VERBAL REASONING -1',
      topics: [
        // Analytical Reasoning
        Topic(
          title: 'Analytical Reasoning',
          id: 65,
          subTopics: [
            SubTopic(
                title: 'Analytical Reasoning Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/analytical-reasoning/'),
            SubTopic(
                title: 'Analytical Reasoning Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/analytical-reasoning/008001'),
          ],
        ),
        // Water Images
        Topic(
          title: 'Water Images',
          id: 66,
          subTopics: [
            SubTopic(
                title: 'Water Images Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/water-images/'),
            SubTopic(
                title: 'Water Images Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/water-images/012001'),
          ],
        ),
        // Mirror Images
        Topic(
          title: 'Mirror Images',
          id: 67,
          subTopics: [
            SubTopic(
                title: 'Mirror Images Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/mirror-images/'),
            SubTopic(
                title: 'Mirror Images Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/mirror-images/010001'),
          ],
        ),
        // Embedded Images
        Topic(
          title: 'Embedded Images',
          id: 68,
          subTopics: [
            SubTopic(
                title: 'Embedded Images Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/embedded-images/'),
            SubTopic(
                title: 'Embedded Images Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/embedded-images/014001'),
          ],
        ),
        // Pattern Completion
        Topic(
          title: 'Pattern Completion',
          id: 69,
          subTopics: [
            SubTopic(
                title: 'Pattern Completion Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/pattern-completion/'),
            SubTopic(
                title: 'Pattern Completion Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/pattern-completion/016001'),
          ],
        ),
        // Figure Matrix
        Topic(
          title: 'Figure Matrix',
          id: 70,
          subTopics: [
            SubTopic(
                title: 'Figure Matrix Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/figure-matrix/'),
            SubTopic(
                title: 'Figure Matrix Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/figure-matrix/018001'),
          ],
        ),
        // Paper Folding
        Topic(
          title: 'Paper Folding',
          id: 71,
          subTopics: [
            SubTopic(
                title: 'Paper Folding Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/paper-folding/'),
            SubTopic(
                title: 'Paper Folding Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/paper-folding/020001'),
          ],
        ),
        // Paper Cutting
        Topic(
          title: 'Paper Cutting',
          id: 72,
          subTopics: [
            SubTopic(
                title: 'Paper Cutting Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/paper-cutting/'),
            SubTopic(
                title: 'Paper Cutting Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/paper-cutting/022001'),
          ],
        ),
        // Rule Detection
        Topic(
          title: 'Rule Detection',
          id: 73,
          subTopics: [
            SubTopic(
                title: 'Rule Detection Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/rule-detection-1'),
            SubTopic(
                title: 'Rule Detection Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/rule-detection-2'),
            SubTopic(
                title: 'Rule Detection Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/rule-detection-3'),
            SubTopic(
                title: 'Rule Detection Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/rule-detection/'),
            SubTopic(
                title: 'Rule Detection Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/rule-detection/024001'),
          ],
        ),
        // Grouping of Images
        Topic(
          title: 'Grouping of Images',
          id: 74,
          subTopics: [
            SubTopic(
                title: 'Grouping of Images Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/grouping-of-images/'),
            SubTopic(
                title: 'Grouping of Images Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/grouping-of-images/026001'),
          ],
        ),
        // Image Analysis
        Topic(
          title: 'Image Analysis',
          id: 75,
          subTopics: [
            SubTopic(
                title: 'Image Analysis Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/image-analysis/'),
            SubTopic(
                title: 'Image Analysis Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/image-analysis/033001'),
            SubTopic(
                title: 'Image Analysis Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/image-analysis/034001'),
          ],
        ),
        // Shape Construction
        Topic(
          title: 'Shape Construction',
          id: 76,
          subTopics: [
            SubTopic(
                title: 'Shape Construction Problem Set - 1',
                problemLink:
                    'https://www.javatpoint.com/construction-of-shapes-1'),
            SubTopic(
                title: 'Shape Construction Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/construction-of-shapes-2'),
            SubTopic(
                title: 'Shape Construction Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/construction-of-shapes-3'),
            SubTopic(
                title: 'Shape Construction Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/shape-construction/'),
            SubTopic(
                title: 'Shape Construction Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/shape-construction/030001'),
            SubTopic(
                title: 'Shape Construction Quiz - 3',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/shape-construction/031001'),
          ],
        ),
        // Cubes and Dice
        Topic(
          title: 'Cubes and Dice',
          id: 77,
          subTopics: [
            SubTopic(
                title: 'Cubes and Dice Concepts',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/cubes-and-dice/introduction'),
            SubTopic(
                title: 'Cubes and Dice Quiz - 1',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/cubes-and-dice/'),
            SubTopic(
                title: 'Cubes and Dice Quiz - 2',
                problemLink:
                    'https://www.indiabix.com/non-verbal-reasoning/cubes-and-dice/036001'),
          ],
        ),
      ],
    ),
    // VERBAL ABILITY -1
    TopicCategory(
      title: 'VERBAL ABILITY -1',
      topics: [
        // Antonyms & Synonyms
        Topic(
          title: 'Antonyms & Synonyms',
          id: 78,
          subTopics: [
            SubTopic(
                title: 'Antonyms',
                problemLink: 'https://www.javatpoint.com/antonyms'),
            SubTopic(
                title: 'Antonyms and Synonyms',
                problemLink:
                    'https://www.tutorialspoint.com/verbal_ability/verbal_ability_synonym_antonym_questions.htm'),
            SubTopic(
                title: 'Vocabulary, Antonyms and Synonyms',
                problemLink:
                    'https://www.naukri.com/code360/guided-paths/aptitude-preparation/content/124421/offering/1463111'),
            SubTopic(
                title: 'Synonyms Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/synonyms'),
            SubTopic(
                title: 'Synonyms Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/synonyms-2'),
            SubTopic(
                title: 'Synonyms Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/synonyms-3'),
            SubTopic(
                title: 'Synonyms Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/synonyms-4'),
            SubTopic(
                title: 'Synonyms Problem Set - 5',
                problemLink: 'https://www.javatpoint.com/synonyms-5'),
            SubTopic(
                title: 'Synonyms Problem Set - 6',
                problemLink: 'https://www.javatpoint.com/synonyms-6'),
            SubTopic(
                title: 'Synonyms Problem Set - 7',
                problemLink: 'https://www.javatpoint.com/synonyms-7'),
            SubTopic(
                title: 'Synonyms Problem Set - 8',
                problemLink: 'https://www.javatpoint.com/synonyms-8'),
            SubTopic(
                title: 'Synonyms Problem Set - 9',
                problemLink: 'https://www.javatpoint.com/synonyms-9'),
            SubTopic(
                title: 'Synonyms Problem Set - 10',
                problemLink: 'https://www.javatpoint.com/synonyms-10'),
            SubTopic(
                title: 'Synonyms Problem Set - 11',
                problemLink: 'https://www.javatpoint.com/synonyms-111'),
            SubTopic(
                title: 'Synonyms Problem Set - 12',
                problemLink: 'https://www.javatpoint.com/synonyms-12'),
            SubTopic(
                title: 'Synonyms Problem Set - 13',
                problemLink: 'https://www.javatpoint.com/synonyms-18'),
            SubTopic(
                title: 'Synonyms Problem Set - 14',
                problemLink: 'https://www.javatpoint.com/synonyms-19'),
            SubTopic(
                title: 'Synonyms Problem Set - 15',
                problemLink: 'https://www.javatpoint.com/synonyms-20'),
            SubTopic(
                title: 'Antonyms Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/antonyms-1'),
            SubTopic(
                title: 'Antonyms Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/antonyms-2'),
            SubTopic(
                title: 'Antonyms Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/antonyms-3'),
            SubTopic(
                title: 'Antonyms Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/antonyms-4'),
            SubTopic(
                title: 'Antonyms Problem Set - 5',
                problemLink: 'https://www.javatpoint.com/antonyms-5'),
            SubTopic(
                title: 'Antonyms Problem Set - 6',
                problemLink: 'https://www.javatpoint.com/antonyms-6'),
            SubTopic(
                title: 'Antonyms Problem Set - 7',
                problemLink: 'https://www.javatpoint.com/antonyms-7'),
            SubTopic(
                title: 'Antonyms Problem Set - 8',
                problemLink: 'https://www.javatpoint.com/antonyms-8'),
            SubTopic(
                title: 'Antonyms Problem Set - 9',
                problemLink: 'https://www.javatpoint.com/antonyms-9'),
            SubTopic(
                title: 'Antonyms Problem Set - 10',
                problemLink: 'https://www.javatpoint.com/antonyms-10'),
            SubTopic(
                title: 'Antonyms Problem Set - 11',
                problemLink: 'https://www.javatpoint.com/antonyms-16'),
            SubTopic(
                title: 'Antonyms Problem Set - 12',
                problemLink: 'https://www.javatpoint.com/antonyms-17'),
            SubTopic(
                title: 'Antonyms Problem Set - 13',
                problemLink: 'https://www.javatpoint.com/antonyms-18'),
            SubTopic(
                title: 'Antonyms Problem Set - 14',
                problemLink: 'https://www.javatpoint.com/antonyms-19'),
            SubTopic(
                title: 'Antonyms Problem Set - 15',
                problemLink: 'https://www.javatpoint.com/antonyms-20'),
            SubTopic(
                title: 'Antonyms and Synonyms Quiz',
                problemLink:
                    'https://www.tutorialspoint.com/verbal_ability/verbal_ability_synonym_antonym_questions_online_quiz.htm'),
          ],
        ),
        // Error Spotting
        Topic(
          title: 'Error Spotting',
          id: 79,
          subTopics: [
            SubTopic(
                title: 'Error Spotting Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/spotting-errors'),
            SubTopic(
                title: 'Error Spotting Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/spotting-errors-2'),
            SubTopic(
                title: 'Error Spotting Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/spotting-errors-3'),
            SubTopic(
                title: 'Error Spotting Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/spotting-errors-4'),
            SubTopic(
                title: 'Error Spotting Problem Set - 5',
                problemLink: 'https://www.javatpoint.com/spotting-errors-5'),
            SubTopic(
                title: 'Error Spotting Problem Set - 6',
                problemLink: 'https://www.javatpoint.com/spotting-errors-6'),
            SubTopic(
                title: 'Error Spotting Problem Set - 7',
                problemLink: 'https://www.javatpoint.com/spotting-errors-7'),
            SubTopic(
                title: 'Error Spotting Problem Set - 8',
                problemLink: 'https://www.javatpoint.com/spotting-errors-8'),
            SubTopic(
                title: 'Error Spotting Problem Set - 9',
                problemLink: 'https://www.javatpoint.com/spotting-errors-9'),
            SubTopic(
                title: 'Error Spotting Problem Set - 10',
                problemLink: 'https://www.javatpoint.com/spotting-errors-10'),
            SubTopic(
                title: 'Error Spotting Problem Set - 11',
                problemLink: 'https://www.javatpoint.com/spotting-errors-15'),
            SubTopic(
                title: 'Error Spotting Problem Set - 12',
                problemLink: 'https://www.javatpoint.com/spotting-errors-16'),
            SubTopic(
                title: 'Error Spotting Problem Set - 13',
                problemLink: 'https://www.javatpoint.com/spotting-errors-17'),
            SubTopic(
                title: 'Error Spotting Problem Set - 14',
                problemLink: 'https://www.javatpoint.com/spotting-errors-18'),
            SubTopic(
                title: 'Error Spotting Problem Set - 15',
                problemLink: 'https://www.javatpoint.com/spotting-errors-19'),
            SubTopic(
                title: 'Error Spotting Problem Set - 16',
                problemLink: 'https://www.javatpoint.com/spotting-errors-20'),
            SubTopic(
                title: 'Error Spotting Quiz',
                problemLink:
                    'https://www.indiabix.com/verbal-ability/spotting-errors/'),
          ],
        ),
        // Ordering of Words
        Topic(
          title: 'Ordering of Words',
          id: 80,
          subTopics: [
            SubTopic(
                title: 'Ordering of Words Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/ordering-of-words'),
            SubTopic(
                title: 'Ordering of Words Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/ordering-of-words-2'),
            SubTopic(
                title: 'Ordering of Words Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/ordering-of-words-3'),
            SubTopic(
                title: 'Ordering of Words Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/ordering-of-words-4'),
            SubTopic(
                title: 'Ordering of Words Problem Set - 5',
                problemLink: 'https://www.javatpoint.com/ordering-of-words-5'),
            SubTopic(
                title: 'Ordering of Words Problem Set - 6',
                problemLink: 'https://www.javatpoint.com/ordering-of-words-6'),
            SubTopic(
                title: 'Ordering of Words Problem Set - 7',
                problemLink: 'https://www.javatpoint.com/ordering-of-words-7'),
            SubTopic(
                title: 'Ordering of Words Problem Set - 8',
                problemLink: 'https://www.javatpoint.com/ordering-of-words-8'),
            SubTopic(
                title: 'Ordering of Words Problem Set - 9',
                problemLink: 'https://www.javatpoint.com/ordering-of-words-9'),
            SubTopic(
                title: 'Ordering of Words Problem Set - 10',
                problemLink: 'https://www.javatpoint.com/ordering-of-words-10'),
            SubTopic(
                title: 'Ordering of Words Quiz',
                problemLink:
                    'https://www.indiabix.com/verbal-ability/ordering-of-words/'),
          ],
        ),
        // Ordering of Sentences
        Topic(
          title: 'Ordering of Sentences',
          id: 81,
          subTopics: [
            SubTopic(
                title: 'Ordering of Sentences Problem Set - 1',
                problemLink:
                    'https://www.javatpoint.com/ordering-of-sentences'),
            SubTopic(
                title: 'Ordering of Sentences Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/ordering-of-sentences-2'),
            SubTopic(
                title: 'Ordering of Sentences Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/ordering-of-sentences-3'),
            SubTopic(
                title: 'Ordering of Sentences Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/ordering-of-sentences-4'),
            SubTopic(
                title: 'Ordering of Sentences Quiz',
                problemLink:
                    'https://www.indiabix.com/verbal-ability/ordering-of-sentences/'),
          ],
        ),
        // Sentence Formation
        Topic(
          title: 'Sentence Formation',
          id: 82,
          subTopics: [
            SubTopic(
                title: 'Sentence Formation Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/sentence-formation'),
            SubTopic(
                title: 'Sentence Formation Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/sentence-formation-2'),
            SubTopic(
                title: 'Sentence Formation Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/sentence-formation-3'),
            SubTopic(
                title: 'Sentence Formation Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/sentence-formation-4'),
            SubTopic(
                title: 'Sentence Formation Problem Set - 5',
                problemLink: 'https://www.javatpoint.com/sentence-formation-5'),
            SubTopic(
                title: 'Sentence Formation Problem Set - 6',
                problemLink: 'https://www.javatpoint.com/sentence-formation-6'),
            SubTopic(
                title: 'Sentence Formation Problem Set - 7',
                problemLink: 'https://www.javatpoint.com/sentence-formation-7'),
            SubTopic(
                title: 'Sentence Formation Problem Set - 8',
                problemLink: 'https://www.javatpoint.com/sentence-formation-8'),
            SubTopic(
                title: 'Sentence Formation Problem Set - 9',
                problemLink: 'https://www.javatpoint.com/sentence-formation-9'),
            SubTopic(
                title: 'Sentence Formation Problem Set - 10',
                problemLink:
                    'https://www.javatpoint.com/sentence-formation-10'),
            SubTopic(
                title: 'Sentence Formation Quiz',
                problemLink:
                    'https://www.indiabix.com/verbal-ability/sentence-formation/'),
          ],
        ),
        // Sentence Correction
        Topic(
          title: 'Sentence Correction',
          id: 83,
          subTopics: [
            SubTopic(
                title: 'Sentence Correction Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/sentence-correction'),
            SubTopic(
                title: 'Sentence Correction Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/sentence-correction-2'),
            SubTopic(
                title: 'Sentence Correction Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/sentence-correction-3'),
            SubTopic(
                title: 'Sentence Correction Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/sentence-correction-4'),
            SubTopic(
                title: 'Sentence Correction Problem Set - 5',
                problemLink:
                    'https://www.javatpoint.com/sentence-correction-5'),
            SubTopic(
                title: 'Sentence Correction Problem Set - 6',
                problemLink:
                    'https://www.javatpoint.com/sentence-correction-6'),
            SubTopic(
                title: 'Sentence Correction Problem Set - 7',
                problemLink:
                    'https://www.javatpoint.com/sentence-correction-7'),
            SubTopic(
                title: 'Sentence Correction Problem Set - 8',
                problemLink:
                    'https://www.javatpoint.com/sentence-correction-8'),
            SubTopic(
                title: 'Sentence Correction Problem Set - 9',
                problemLink:
                    'https://www.javatpoint.com/sentence-correction-9'),
            SubTopic(
                title: 'Sentence Correction Problem Set - 10',
                problemLink:
                    'https://www.javatpoint.com/sentence-correction-10'),
            SubTopic(
                title: 'Sentence Correction Quiz',
                problemLink:
                    'https://www.indiabix.com/verbal-ability/sentence-correction/'),
          ],
        ),
      ],
    ),
    // VERBAL ABILITY -2
    TopicCategory(
      title: 'VERBAL ABILITY -2',
      topics: [
        // Paragraph Formation
        Topic(
          title: 'Paragraph Formation',
          id: 84,
          subTopics: [
            SubTopic(
                title: 'Paragraph Formation Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/paragraph-formation'),
            SubTopic(
                title: 'Paragraph Formation Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/paragraph-formation-2'),
            SubTopic(
                title: 'Paragraph Formation Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/paragraph-formation-3'),
            SubTopic(
                title: 'Paragraph Formation Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/paragraph-formation-4'),
            SubTopic(
                title: 'Paragraph Formation Quiz',
                problemLink:
                    'https://www.indiabix.com/verbal-ability/paragraph-formation/035001'),
          ],
        ),
        // Cloze Test
        Topic(
          title: 'Cloze Test',
          id: 85,
          subTopics: [
            SubTopic(
                title: 'Cloze Test Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/closet-test'),
            SubTopic(
                title: 'Cloze Test Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/closet-test-2'),
            SubTopic(
                title: 'Cloze Test Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/closet-test-3'),
            SubTopic(
                title: 'Cloze Test Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/closet-test-4'),
            SubTopic(
                title: 'Cloze Test Problem Set - 5',
                problemLink: 'https://www.javatpoint.com/closet-test-5'),
            SubTopic(
                title: 'Cloze Test Quiz',
                problemLink:
                    'https://www.indiabix.com/verbal-ability/closet-test/070001'),
          ],
        ),
        // Comprehensions
        Topic(
          title: 'Comprehensions',
          id: 86,
          subTopics: [
            SubTopic(
                title: 'Comprehensions Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/comprehension'),
            SubTopic(
                title: 'Comprehensions Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/comprehension-2'),
            SubTopic(
                title: 'Comprehensions Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/comprehension-3'),
            SubTopic(
                title: 'Comprehensions Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/comprehension-4'),
            SubTopic(
                title: 'Comprehensions Quiz',
                problemLink:
                    'https://www.indiabix.com/verbal-ability/comprehension/102001'),
          ],
        ),
        // Verbal Analogies
        Topic(
          title: 'Verbal Analogies',
          id: 87,
          subTopics: [
            SubTopic(
                title: 'Verbal Analogies Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/verbal-analogies'),
            SubTopic(
                title: 'Verbal Analogies Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/verbal-analogies-2'),
            SubTopic(
                title: 'Verbal Analogies Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/verbal-analogies-3'),
            SubTopic(
                title: 'Verbal Analogies Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/verbal-analogies-4'),
            SubTopic(
                title: 'Verbal Analogies Problem Set - 5',
                problemLink: 'https://www.javatpoint.com/verbal-analogies-5'),
            SubTopic(
                title: 'Verbal Analogies Problem Set - 6',
                problemLink: 'https://www.javatpoint.com/verbal-analogies-6'),
            SubTopic(
                title: 'Verbal Analogies Quiz',
                problemLink:
                    'https://www.indiabix.com/verbal-ability/verbal-analogies/'),
          ],
        ),
        // One Word Substitutes
        Topic(
          title: 'One Word Substitutes',
          id: 88,
          subTopics: [
            SubTopic(
                title: 'One Word Substitutes Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/one-word-substitutes'),
            SubTopic(
                title: 'One Word Substitutes Problem Set - 2',
                problemLink:
                    'https://www.javatpoint.com/one-word-substitutes-2'),
            SubTopic(
                title: 'One Word Substitutes Problem Set - 3',
                problemLink:
                    'https://www.javatpoint.com/one-word-substitutes-3'),
            SubTopic(
                title: 'One Word Substitutes Problem Set - 4',
                problemLink:
                    'https://www.javatpoint.com/one-word-substitutes-4'),
            SubTopic(
                title: 'One Word Substitutes Problem Set - 5',
                problemLink:
                    'https://www.javatpoint.com/one-word-substitutes-5'),
            SubTopic(
                title: 'One Word Substitutes Problem Set - 6',
                problemLink:
                    'https://www.javatpoint.com/one-word-substitutes-6'),
            SubTopic(
                title: 'One Word Substitutes Problem Set - 7',
                problemLink:
                    'https://www.javatpoint.com/one-word-substitutes-7'),
            SubTopic(
                title: 'One Word Substitutes Problem Set - 8',
                problemLink:
                    'https://www.javatpoint.com/one-word-substitutes-8'),
            SubTopic(
                title: 'One Word Substitutes Problem Set - 9',
                problemLink:
                    'https://www.javatpoint.com/one-word-substitutes-9'),
            SubTopic(
                title: 'One Word Substitutes Problem Set - 10',
                problemLink:
                    'https://www.javatpoint.com/one-word-substitutes-10'),
            SubTopic(
                title: 'One Word Substitutes Quiz',
                problemLink:
                    'https://www.indiabix.com/verbal-ability/one-word-substitutes/'),
          ],
        ),
        // Selecting Words
        Topic(
          title: 'Selecting Words',
          id: 89,
          subTopics: [
            SubTopic(
                title: 'Selecting Words Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/selecting-words'),
            SubTopic(
                title: 'Selecting Words Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/selecting-words-2'),
            SubTopic(
                title: 'Selecting Words Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/selecting-words-3'),
            SubTopic(
                title: 'Selecting Words Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/selecting-words-4'),
            SubTopic(
                title: 'Selecting Words Problem Set - 5',
                problemLink: 'https://www.javatpoint.com/selecting-words-5'),
            SubTopic(
                title: 'Selecting Words Problem Set - 6',
                problemLink: 'https://www.javatpoint.com/selecting-words-6'),
            SubTopic(
                title: 'Selecting Words Problem Set - 7',
                problemLink: 'https://www.javatpoint.com/selecting-words-7'),
            SubTopic(
                title: 'Selecting Words Problem Set - 8',
                problemLink: 'https://www.javatpoint.com/selecting-words-8'),
            SubTopic(
                title: 'Selecting Words Problem Set - 9',
                problemLink: 'https://www.javatpoint.com/selecting-words-9'),
            SubTopic(
                title: 'Selecting Words Problem Set - 10',
                problemLink: 'https://www.javatpoint.com/selecting-words-10'),
            SubTopic(
                title: 'Selecting Words Problem Set - 11',
                problemLink: 'https://www.javatpoint.com/selecting-words-11'),
            SubTopic(
                title: 'Selecting Words Problem Set - 12',
                problemLink: 'https://www.javatpoint.com/selecting-words-12'),
            SubTopic(
                title: 'Selecting Words Problem Set - 13',
                problemLink: 'https://www.javatpoint.com/selecting-words-13'),
            SubTopic(
                title: 'Selecting Words Problem Set - 14',
                problemLink: 'https://www.javatpoint.com/selecting-words-14'),
            SubTopic(
                title: 'Selecting Words Problem Set - 15',
                problemLink: 'https://www.javatpoint.com/selecting-words-15'),
            SubTopic(
                title: 'Selecting Words Problem Set - 16',
                problemLink: 'https://www.javatpoint.com/selecting-words-16'),
            SubTopic(
                title: 'Selecting Words Problem Set - 17',
                problemLink: 'https://www.javatpoint.com/selecting-words-17'),
            SubTopic(
                title: 'Selecting Words Problem Set - 18',
                problemLink: 'https://www.javatpoint.com/selecting-words-18'),
            SubTopic(
                title: 'Selecting Words Problem Set - 19',
                problemLink: 'https://www.javatpoint.com/selecting-words-19'),
            SubTopic(
                title: 'Selecting Words Quiz',
                problemLink:
                    'https://www.indiabix.com/verbal-ability/selecting-words/'),
          ],
        ),
        // Articles
        Topic(
          title: 'Articles',
          id: 90,
          subTopics: [
            SubTopic(
                title: 'Articles Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/articles'),
            SubTopic(
                title: 'Articles Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/articles-2'),
            SubTopic(
                title: 'Articles Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/articles-3'),
            SubTopic(
                title: 'Articles Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/articles-4'),
            SubTopic(
                title: 'Articles Problem Set - 5',
                problemLink: 'https://www.javatpoint.com/articles-5'),
            SubTopic(
                title: 'Articles Problem Set - 6',
                problemLink: 'https://www.javatpoint.com/articles-6'),
            SubTopic(
                title: 'Articles Problem Set - 7',
                problemLink: 'https://www.javatpoint.com/articles-7'),
          ],
        ),
        // Prepositions
        Topic(
          title: 'Prepositions',
          id: 91,
          subTopics: [
            SubTopic(
                title: 'Prepositions Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/prepositions'),
            SubTopic(
                title: 'Prepositions Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/prepositions-2'),
            SubTopic(
                title: 'Prepositions Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/prepositions-3'),
            SubTopic(
                title: 'Prepositions Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/prepositions-4'),
            SubTopic(
                title: 'Prepositions Problem Set - 5',
                problemLink: 'https://www.javatpoint.com/prepositions-5'),
            SubTopic(
                title: 'Prepositions Problem Set - 6',
                problemLink: 'https://www.javatpoint.com/prepositions-6'),
            SubTopic(
                title: 'Prepositions Problem Set - 7',
                problemLink: 'https://www.javatpoint.com/prepositions-7'),
            SubTopic(
                title: 'Prepositions Problem Set - 8',
                problemLink: 'https://www.javatpoint.com/prepositions-8'),
            SubTopic(
                title: 'Prepositions Problem Set - 9',
                problemLink: 'https://www.javatpoint.com/prepositions-9'),
            SubTopic(
                title: 'Prepositions Problem Set - 10',
                problemLink: 'https://www.javatpoint.com/prepositions-10'),
          ],
        ),
        // Idioms and Phrases
        Topic(
          title: 'Idioms and Phrases',
          id: 92,
          subTopics: [
            SubTopic(
                title: 'Idioms and Phrases Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/idioms-and-phrases'),
            SubTopic(
                title: 'Idioms and Phrases Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/idioms-and-phrases-2'),
            SubTopic(
                title: 'Idioms and Phrases Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/idioms-and-phrases-3'),
            SubTopic(
                title: 'Idioms and Phrases Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/idioms-and-phrases-4'),
            SubTopic(
                title: 'Idioms and Phrases Problem Set - 5',
                problemLink: 'https://www.javatpoint.com/idioms-and-phrases-5'),
            SubTopic(
                title: 'Idioms and Phrases Problem Set - 6',
                problemLink: 'https://www.javatpoint.com/idioms-and-phrases-6'),
            SubTopic(
                title: 'Idioms and Phrases Quiz',
                problemLink:
                    'https://www.indiabix.com/verbal-ability/idioms-and-phrases/108001'),
          ],
        ),
        // Change of Voice
        Topic(
          title: 'Change of Voice',
          id: 93,
          subTopics: [
            SubTopic(
                title: 'Change of Voice Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/change-of-voice'),
            SubTopic(
                title: 'Change of Voice Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/change-of-voice-2'),
            SubTopic(
                title: 'Change of Voice Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/change-of-voice-3'),
            SubTopic(
                title: 'Change of Voice Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/change-of-voice-4'),
            SubTopic(
                title: 'Change of Voice Problem Set - 5',
                problemLink: 'https://www.javatpoint.com/change-of-voice-5'),
            SubTopic(
                title: 'Change of Voice Problem Set - 6',
                problemLink: 'https://www.javatpoint.com/change-of-voice-6'),
            SubTopic(
                title: 'Change of Voice Quiz',
                problemLink:
                    'https://www.indiabix.com/verbal-ability/change-of-voice/'),
          ],
        ),
        // Change of Speech
        Topic(
          title: 'Change of Speech',
          id: 94,
          subTopics: [
            SubTopic(
                title: 'Change of Speech Problem Set - 1',
                problemLink: 'https://www.javatpoint.com/change-of-speech'),
            SubTopic(
                title: 'Change of Speech Problem Set - 2',
                problemLink: 'https://www.javatpoint.com/change-of-speech-2'),
            SubTopic(
                title: 'Change of Speech Problem Set - 3',
                problemLink: 'https://www.javatpoint.com/change-of-speech-3'),
            SubTopic(
                title: 'Change of Speech Problem Set - 4',
                problemLink: 'https://www.javatpoint.com/change-of-speech-4'),
            SubTopic(
                title: 'Change of Speech Problem Set - 5',
                problemLink: 'https://www.javatpoint.com/change-of-speech-5'),
            SubTopic(
                title: 'Change of Speech Problem Set - 6',
                problemLink: 'https://www.javatpoint.com/change-of-speech-6'),
            SubTopic(
                title: 'Change of Speech Quiz',
                problemLink:
                    'https://www.indiabix.com/verbal-ability/change-of-speech/'),
          ],
        ),
      ],
    ),
    // PROGRAMMING LANGUAGES
    TopicCategory(
      title: 'PROGRAMMING LANGUAGES',
      topics: [
        // Topic: C
        Topic(
          title: 'C',
          id: 95,
          subTopics: [
            SubTopic(
                title:
                    'Basics: Syntax, data types, variables, and operators, Control structures (if-else, loops)',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Functions & Arrays: Function declaration, recursion, and parameter passing, Arrays and strings',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Pointers & Memory Management: Pointers, pointer arithmetic, and dynamic memory allocation, Memory leaks and management techniques',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Structures & File I/O: Structures, unions, and preprocessor directives',
                problemLink: 'https://example.com/numbersystem1'),
          ],
        ),
        // Topic: C++
        Topic(
          title: 'C++',
          id: 96,
          subTopics: [
            SubTopic(
                title:
                    'Fundamentals: Basic syntax, data types, and control structures (loops, conditionals)',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Object-Oriented Programming (OOP): Classes and objects, inheritance, polymorphism, encapsulation, Constructors, destructors, and operator overloading',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Standard Template Library (STL): Vectors, lists, maps, and algorithms, Iterators and containers',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Advanced Topics: Templates and exception handling, Memory management (pointers, smart pointers), Lambda expressions',
                problemLink: 'https://example.com/numbersystem1'),
          ],
        ),
        // Topic: Java
        Topic(
          title: 'Java',
          id: 97,
          subTopics: [
            SubTopic(
                title:
                    'Core Concepts: Syntax, data types, and control structures, Variables and operators',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'OOP Concepts: Classes, objects, inheritance, encapsulation, and polymorphism, Interfaces and abstract classes',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Exception Handling & APIs: Try-catch blocks and custom exceptions, Standard libraries and packages',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Collections & Concurrency: Collections framework (lists, sets, maps), Multithreading basics and synchronization',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'JVM Fundamentals: Garbage collection and memory management, Basics of the Java Virtual Machine',
                problemLink: 'https://example.com/numbersystem1'),
          ],
        ),
        // Topic: Python
        Topic(
          title: 'Python',
          id: 98,
          subTopics: [
            SubTopic(
                title:
                    'Basics: Syntax, data types (lists, dictionaries, tuples, sets), Variables and basic operators',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Control Structures & Functions: Conditionals, loops, list comprehensions, Function definition, lambda functions, and recursion',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Modules & Packages: Importing and using standard libraries, Creating and managing packages',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Object-Oriented Programming: Classes, objects, inheritance, and special methods',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Advanced Concepts: Exception handling, file I/O, and generators, Decorators and context managers',
                problemLink: 'https://example.com/numbersystem1'),
          ],
        ),
        // Topic: JavaScript
        Topic(
          title: 'JavaScript',
          id: 99,
          subTopics: [
            SubTopic(
                title:
                    'Core Syntax & Data Types: Variables (var, let, const), data types, and operators, Basic control structures (if-else, loops)',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Functions & Scope: Function declarations, expressions, and closures, Scope and hoisting',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Modern JavaScript (ES6+): Arrow functions, template literals, destructuring, and spread/rest operators, Promises and async/await for asynchronous programming',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'DOM Manipulation & Event Handling: Basics of the Document Object Model (DOM), Event listeners and handling user interactions',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Error Handling & Debugging: Try-catch blocks and debugging techniques',
                problemLink: 'https://example.com/numbersystem1'),
          ],
        ),
        // Topic: SQL
        Topic(
          title: 'SQL',
          id: 100,
          subTopics: [
            SubTopic(
                title:
                    'Database Fundamentals: Basic database concepts, tables, and relationships, Primary keys, foreign keys, and indexing',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'CRUD Operations: SELECT, INSERT, UPDATE, and DELETE queries, Filtering and sorting data',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Joins & Subqueries: INNER, LEFT, RIGHT, and FULL joins, Nested queries and subqueries',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Aggregations & Grouping: Using aggregate functions (SUM, AVG, COUNT, etc.), GROUP BY and HAVING clauses',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Transactions & Normalization: Transaction control (commit, rollback), Basic normalization principles',
                problemLink: 'https://example.com/numbersystem1'),
          ],
        ),
        // Topic: Mobile-Specific Languages
        Topic(
          title: 'Mobile-Specific Languages',
          id: 101,
          subTopics: [
            SubTopic(
                title:
                    'C# (for .NET applications) - Core Concepts: Syntax, data types, and control structures; Object-oriented programming fundamentals',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'C# (for .NET applications) - Advanced Topics: Exception handling and LINQ; Asynchronous programming (async/await); Basics of the .NET framework',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Swift/Kotlin (for iOS/Android) - Fundamentals: Syntax, variables, and control structures; Basic data types and operators',
                problemLink: 'https://example.com/numbersystem1'),
            SubTopic(
                title:
                    'Swift/Kotlin (for iOS/Android) - OOP & Advanced Features: Classes, inheritance, and protocols (Swift) or interfaces (Kotlin); Error handling and optional/null safety; Functional programming aspects (closures in Swift, lambdas in Kotlin)',
                problemLink: 'https://example.com/numbersystem1'),
          ],
        ),
      ],
    ),
  ];
}
