cask "agentduck" do
  version "1.0.0,92d1a00"
  sha256 "e1d3cc076e4c313a9e4b81b38e96aeb7597d332061e3fee5f35d02d37ff464ed"

  url "https://updates.getagentduck.com/downloads/AgentDuck-#{version.csv.first}-#{version.csv.second}.dmg"
  name "AgentDuck"
  desc "Usage, limits and cost for AI coding agents in the menu bar"
  homepage "https://getagentduck.com/"

  livecheck do
    url "https://updates.getagentduck.com/appcast.xml"
    strategy :sparkle do |item|
      "#{item.short_version},#{item.url[/-(\h+)\.zip/i, 1]}"
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "AgentDuck.app"

  zap trash: [
    "~/.agentduck",
    "~/Library/Application Support/AgentDuck",
    "~/Library/Caches/com.calmdelight.AgentDuck",
    "~/Library/HTTPStorages/com.calmdelight.AgentDuck",
    "~/Library/Logs/AgentDuck",
    "~/Library/Preferences/com.calmdelight.AgentDuck.plist",
    "~/Library/Saved Application State/com.calmdelight.AgentDuck.savedState",
  ]
end
