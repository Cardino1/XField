# frozen_string_literal: true

puts "Seeding default content..."

if Article.count.zero?
  3.times do |index|
    Article.create!(
      title: "XField Insight ##{index + 1}",
      summary: "A concise overview of the latest development in frontier technology.",
      content: "## Headline\n\nDetailed analysis for founders, operators, and investors on what this means next.",
      published_on: Date.today - index.weeks,
      hero_image_url: "https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5"
    )
  end
end

if Opportunity.count.zero?
  Opportunity.create!(
    opportunity_type: :jobs,
    title: "Founding Engineer",
    full_name: "Amelia Founder",
    organization: "QuantumLeap Labs",
    description: "Build the next-generation AI stack for climate resilience alongside a world-class team.",
    link: "https://example.com/jobs/founding-engineer",
    approved: true
  )
end

if Investor.count.zero?
  Investor.create!(
    firm_name: "Atlas Ventures",
    contact_name: "Jordan Rivera",
    email: "team@atlasvc.com",
    website: "https://atlasvc.com",
    values: "Backing ambitious founders building category-defining companies.",
    looking_for: "Pre-seed to Series A teams reimagining hard tech and AI.",
    portfolio_highlights: "Lumina Robotics, Flux Quantum, Horizon AI",
    request_for_startups: "Applied AI for infrastructure, climate frontier tech, and neurotechnology interfaces.",
    approved: true
  )
end

puts "Seed complete."
