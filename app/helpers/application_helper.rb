# frozen_string_literal: true

module ApplicationHelper
  def nav_link_class(active)
    base = "transition hover:text-white"
    active ? "text-white #{base}" : "text-slate-400 #{base}"
  end

  def opportunity_badge(type)
    colors = {
      "jobs" => "bg-emerald-500/10 text-emerald-300 border border-emerald-500/30",
      "research" => "bg-blue-500/10 text-blue-300 border border-blue-500/30",
      "open_source" => "bg-purple-500/10 text-purple-300 border border-purple-500/30",
      "co_founder" => "bg-orange-500/10 text-orange-300 border border-orange-500/30"
    }
    key = type.to_s
    "inline-flex items-center rounded-full px-3 py-1 text-xs font-semibold uppercase tracking-[0.2em] #{colors.fetch(key, colors["jobs"])}"
  end

  def admin_nav_class(active)
    base = "block rounded-xl px-4 py-2 font-medium transition"
    active ? "#{base} bg-primary-600/20 text-white border border-primary-600/40" : "#{base} border border-slate-800 text-slate-300 hover:border-primary-500/40 hover:text-white"
  end
end
