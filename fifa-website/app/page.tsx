"use client";

import { useState } from "react";

export default function Home() {
  const [activeTab, setActiveTab] = useState("matches");

  const liveMatches = [
    { home: "Brazil", away: "Argentina", score: "2 - 1", time: "78'", status: "LIVE" },
    { home: "France", away: "Germany", score: "1 - 1", time: "65'", status: "LIVE" },
    { home: "Spain", away: "Italy", score: "3 - 0", time: "HT", status: "HALF TIME" },
  ];

  const upcomingMatches = [
    { home: "England", away: "Portugal", date: "Nov 18", time: "20:00" },
    { home: "Netherlands", away: "Belgium", date: "Nov 18", time: "22:00" },
    { home: "Croatia", away: "Poland", date: "Nov 19", time: "18:00" },
  ];

  const topPlayers = [
    { name: "Lionel Messi", country: "Argentina", position: "Forward", rating: 93, goals: 28 },
    { name: "Cristiano Ronaldo", country: "Portugal", position: "Forward", rating: 91, goals: 25 },
    { name: "Kylian Mbappé", country: "France", position: "Forward", rating: 92, goals: 31 },
    { name: "Erling Haaland", country: "Norway", position: "Forward", rating: 91, goals: 35 },
  ];

  const news = [
    { title: "World Cup 2026 Qualifiers: Key Matches This Week", category: "Tournament", date: "Nov 15, 2025" },
    { title: "Mbappé Breaks Record with Hat-trick Performance", category: "Players", date: "Nov 14, 2025" },
    { title: "New FIFA Rankings Released: Surprises in Top 10", category: "Rankings", date: "Nov 13, 2025" },
  ];

  return (
    <div className="min-h-screen bg-gradient-to-br from-[#0A1F44] via-[#1a2f5a] to-[#0A1F44] font-[var(--font-poppins)]">
      {/* Navigation */}
      <nav className="bg-[#0A1F44]/80 backdrop-blur-md border-b border-white/10 sticky top-0 z-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between h-16">
            <div className="flex items-center space-x-8">
              <div className="text-2xl font-bold text-white">
                <span className="text-[#00D9FF]">FIFA</span> WORLD
              </div>
              <div className="hidden md:flex space-x-6">
                <a href="#matches" className="text-white/90 hover:text-[#00D9FF] transition-colors font-medium">Matches</a>
                <a href="#players" className="text-white/90 hover:text-[#00D9FF] transition-colors font-medium">Players</a>
                <a href="#tournaments" className="text-white/90 hover:text-[#00D9FF] transition-colors font-medium">Tournaments</a>
                <a href="#news" className="text-white/90 hover:text-[#00D9FF] transition-colors font-medium">News</a>
              </div>
            </div>
            <button className="bg-gradient-to-r from-[#00D9FF] to-[#00A8CC] text-white px-6 py-2 rounded-full font-semibold hover:shadow-lg hover:shadow-[#00D9FF]/50 transition-all">
              Sign In
            </button>
          </div>
        </div>
      </nav>

      {/* Hero Section */}
      <section className="relative overflow-hidden">
        <div className="absolute inset-0 bg-gradient-to-r from-[#00D9FF]/20 to-transparent"></div>
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-20 relative">
          <div className="grid md:grid-cols-2 gap-12 items-center">
            <div>
              <div className="inline-block bg-[#00D9FF]/20 text-[#00D9FF] px-4 py-2 rounded-full text-sm font-semibold mb-4">
                LIVE NOW
              </div>
              <h1 className="text-5xl md:text-6xl font-bold text-white mb-6 leading-tight">
                Experience The Beautiful Game
              </h1>
              <p className="text-xl text-white/80 mb-8">
                Watch live matches, follow your favorite players, and stay updated with the latest football news from around the world.
              </p>
              <div className="flex flex-wrap gap-4">
                <button className="bg-gradient-to-r from-[#00D9FF] to-[#00A8CC] text-white px-8 py-4 rounded-full font-semibold text-lg hover:shadow-xl hover:shadow-[#00D9FF]/50 transition-all">
                  Watch Live
                </button>
                <button className="bg-white/10 backdrop-blur-sm text-white px-8 py-4 rounded-full font-semibold text-lg border border-white/20 hover:bg-white/20 transition-all">
                  Explore
                </button>
              </div>
            </div>
            <div className="relative">
              <div className="bg-gradient-to-br from-[#00D9FF]/30 to-[#00A8CC]/30 rounded-3xl p-8 backdrop-blur-sm border border-white/10">
                <div className="text-center mb-6">
                  <div className="text-[#00D9FF] text-sm font-semibold mb-2">FEATURED MATCH</div>
                  <div className="text-white/60 text-sm mb-4">World Cup Qualifier</div>
                </div>
                <div className="flex items-center justify-between mb-6">
                  <div className="text-center flex-1">
                    <div className="w-20 h-20 bg-white/10 rounded-full mx-auto mb-3 flex items-center justify-center text-3xl">🇧🇷</div>
                    <div className="text-white font-bold text-lg">Brazil</div>
                  </div>
                  <div className="text-center px-6">
                    <div className="text-5xl font-bold text-white mb-2">2 - 1</div>
                    <div className="text-[#00D9FF] text-sm font-semibold">78' LIVE</div>
                  </div>
                  <div className="text-center flex-1">
                    <div className="w-20 h-20 bg-white/10 rounded-full mx-auto mb-3 flex items-center justify-center text-3xl">🇦🇷</div>
                    <div className="text-white font-bold text-lg">Argentina</div>
                  </div>
                </div>
                <button className="w-full bg-white/10 hover:bg-white/20 text-white py-3 rounded-full font-semibold transition-all">
                  View Match Details
                </button>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Matches Section */}
      <section id="matches" className="py-16 bg-black/20">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between mb-8">
            <h2 className="text-3xl font-bold text-white">Match Center</h2>
            <div className="flex gap-2">
              <button
                onClick={() => setActiveTab("matches")}
                className={`px-6 py-2 rounded-full font-semibold transition-all ${
                  activeTab === "matches"
                    ? "bg-[#00D9FF] text-white"
                    : "bg-white/10 text-white/70 hover:bg-white/20"
                }`}
              >
                Live
              </button>
              <button
                onClick={() => setActiveTab("upcoming")}
                className={`px-6 py-2 rounded-full font-semibold transition-all ${
                  activeTab === "upcoming"
                    ? "bg-[#00D9FF] text-white"
                    : "bg-white/10 text-white/70 hover:bg-white/20"
                }`}
              >
                Upcoming
              </button>
            </div>
          </div>

          {activeTab === "matches" && (
            <div className="grid md:grid-cols-3 gap-6">
              {liveMatches.map((match, index) => (
                <div
                  key={index}
                  className="bg-gradient-to-br from-white/10 to-white/5 backdrop-blur-sm rounded-2xl p-6 border border-white/10 hover:border-[#00D9FF]/50 transition-all hover:shadow-lg hover:shadow-[#00D9FF]/20"
                >
                  <div className="flex items-center justify-between mb-4">
                    <span className="text-[#00D9FF] text-xs font-bold">{match.status}</span>
                    <span className="text-white/60 text-sm">{match.time}</span>
                  </div>
                  <div className="space-y-3">
                    <div className="flex items-center justify-between">
                      <span className="text-white font-semibold">{match.home}</span>
                      <span className="text-white text-xl font-bold">{match.score.split(" - ")[0]}</span>
                    </div>
                    <div className="flex items-center justify-between">
                      <span className="text-white font-semibold">{match.away}</span>
                      <span className="text-white text-xl font-bold">{match.score.split(" - ")[1]}</span>
                    </div>
                  </div>
                  <button className="w-full mt-4 bg-white/5 hover:bg-white/10 text-white py-2 rounded-lg text-sm font-semibold transition-all">
                    Watch Live
                  </button>
                </div>
              ))}
            </div>
          )}

          {activeTab === "upcoming" && (
            <div className="grid md:grid-cols-3 gap-6">
              {upcomingMatches.map((match, index) => (
                <div
                  key={index}
                  className="bg-gradient-to-br from-white/10 to-white/5 backdrop-blur-sm rounded-2xl p-6 border border-white/10 hover:border-[#00D9FF]/50 transition-all hover:shadow-lg hover:shadow-[#00D9FF]/20"
                >
                  <div className="flex items-center justify-between mb-4">
                    <span className="text-white/60 text-sm">{match.date}</span>
                    <span className="text-[#00D9FF] text-sm font-bold">{match.time}</span>
                  </div>
                  <div className="space-y-3">
                    <div className="text-white font-semibold text-center">{match.home}</div>
                    <div className="text-white/40 text-center text-sm">VS</div>
                    <div className="text-white font-semibold text-center">{match.away}</div>
                  </div>
                  <button className="w-full mt-4 bg-white/5 hover:bg-white/10 text-white py-2 rounded-lg text-sm font-semibold transition-all">
                    Set Reminder
                  </button>
                </div>
              ))}
            </div>
          )}
        </div>
      </section>

      {/* Players Section */}
      <section id="players" className="py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between mb-8">
            <h2 className="text-3xl font-bold text-white">Top Players</h2>
            <button className="text-[#00D9FF] font-semibold hover:underline">View All</button>
          </div>
          <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
            {topPlayers.map((player, index) => (
              <div
                key={index}
                className="bg-gradient-to-br from-white/10 to-white/5 backdrop-blur-sm rounded-2xl p-6 border border-white/10 hover:border-[#00D9FF]/50 transition-all hover:shadow-lg hover:shadow-[#00D9FF]/20 hover:-translate-y-1"
              >
                <div className="flex items-center justify-between mb-4">
                  <div className="w-16 h-16 bg-gradient-to-br from-[#00D9FF] to-[#00A8CC] rounded-full flex items-center justify-center text-2xl font-bold text-white">
                    {player.rating}
                  </div>
                  <div className="text-right">
                    <div className="text-white/60 text-xs">{player.position}</div>
                    <div className="text-white text-sm font-semibold">{player.country}</div>
                  </div>
                </div>
                <h3 className="text-white font-bold text-lg mb-3">{player.name}</h3>
                <div className="flex items-center justify-between text-sm">
                  <span className="text-white/60">Goals</span>
                  <span className="text-[#00D9FF] font-bold">{player.goals}</span>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* News Section */}
      <section id="news" className="py-16 bg-black/20">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between mb-8">
            <h2 className="text-3xl font-bold text-white">Latest News</h2>
            <button className="text-[#00D9FF] font-semibold hover:underline">View All</button>
          </div>
          <div className="grid md:grid-cols-3 gap-6">
            {news.map((article, index) => (
              <div
                key={index}
                className="bg-gradient-to-br from-white/10 to-white/5 backdrop-blur-sm rounded-2xl overflow-hidden border border-white/10 hover:border-[#00D9FF]/50 transition-all hover:shadow-lg hover:shadow-[#00D9FF]/20"
              >
                <div className="h-48 bg-gradient-to-br from-[#00D9FF]/30 to-[#00A8CC]/30"></div>
                <div className="p-6">
                  <div className="flex items-center gap-3 mb-3">
                    <span className="text-[#00D9FF] text-xs font-bold">{article.category}</span>
                    <span className="text-white/40 text-xs">{article.date}</span>
                  </div>
                  <h3 className="text-white font-semibold text-lg mb-4">{article.title}</h3>
                  <button className="text-[#00D9FF] text-sm font-semibold hover:underline">
                    Read More →
                  </button>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-[#0A1F44] border-t border-white/10 py-12">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid md:grid-cols-4 gap-8 mb-8">
            <div>
              <div className="text-2xl font-bold text-white mb-4">
                <span className="text-[#00D9FF]">FIFA</span> WORLD
              </div>
              <p className="text-white/60 text-sm">
                The official home of world football. Experience the beautiful game.
              </p>
            </div>
            <div>
              <h4 className="text-white font-semibold mb-4">Competitions</h4>
              <ul className="space-y-2 text-white/60 text-sm">
                <li><a href="#" className="hover:text-[#00D9FF] transition-colors">World Cup</a></li>
                <li><a href="#" className="hover:text-[#00D9FF] transition-colors">Champions League</a></li>
                <li><a href="#" className="hover:text-[#00D9FF] transition-colors">Europa League</a></li>
              </ul>
            </div>
            <div>
              <h4 className="text-white font-semibold mb-4">Resources</h4>
              <ul className="space-y-2 text-white/60 text-sm">
                <li><a href="#" className="hover:text-[#00D9FF] transition-colors">News</a></li>
                <li><a href="#" className="hover:text-[#00D9FF] transition-colors">Statistics</a></li>
                <li><a href="#" className="hover:text-[#00D9FF] transition-colors">Rankings</a></li>
              </ul>
            </div>
            <div>
              <h4 className="text-white font-semibold mb-4">Follow Us</h4>
              <ul className="space-y-2 text-white/60 text-sm">
                <li><a href="#" className="hover:text-[#00D9FF] transition-colors">Twitter</a></li>
                <li><a href="#" className="hover:text-[#00D9FF] transition-colors">Instagram</a></li>
                <li><a href="#" className="hover:text-[#00D9FF] transition-colors">YouTube</a></li>
              </ul>
            </div>
          </div>
          <div className="border-t border-white/10 pt-8 text-center text-white/60 text-sm">
            <p>© 2025 FIFA World Football. All rights reserved.</p>
          </div>
        </div>
      </footer>
    </div>
  );
}
