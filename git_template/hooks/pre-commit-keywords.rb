#!/usr/bin/env ruby

# Git pre-commit hook that prevents accidentally committing things that shouldn't be, like:
#
#   * ":focus", used with RSpec/Guard
#   * "show_page", used to debug request specs
#   * "console.log" or "console.debug", used in JavaScript debugging
#   * "DO NOT COMMIT!" comments
#
# Modify the regexps to suit your needs. The error message shows the full regexp match, or just the first capture group, if there is one.
#
# To bypass this commit hook (and others), perhaps when defining ":focus" or "show_page" for the first time, commit with the "--no-verify" option.
#
# By Henrik Nyh <http://henrik.nyh.se> 2011-10-08 under the MIT License.

FORBIDDEN = [
  /[\s,](:focus)\b/,
  /\bshow_page\b/,
  /\bconsole\.log\b/,
  /\bconsole\.debug\b/,
  /\bbinding\.pry\b/,
  /\bdo not commit\b/i
]

full_diff = `git diff --cached --`.force_encoding("ASCII-8BIT")

full_diff.scan(%r{^\+\+\+ b/(.+)\n@@.*\n([\s\S]*?)(?:^diff|\z)}).each do |file, diff|
  added = diff.split("\n").select { |x| x.start_with?("+") }.join("\n")
  if FORBIDDEN.any? { |re| added.match(re) }
    puts %{Git hook forbids adding "#{$1 || $&}" to #{file}}
    puts "To commit anyway, use --no-verify"
    exit 1
  end
end
