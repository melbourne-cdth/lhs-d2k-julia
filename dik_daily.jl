### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 095703b0-294a-4dcf-be5f-79e4c64f956e
using PlutoUI

# ╔═╡ 5a94afc0-0fc6-11ec-3c01-030a879b4c06
md"""# What do you know about data, information, and knowledge?

Before we proceed, I want to let you know that this is a safe-space for the use of the word _data_. If you hae been in academics for very long you will likely have discovered that the use of _data_ exclusively as a plural noun and the word _datum_ as the singular version is the _sine qua non_ of academic speech. However, I disagree. I quote Bill Walsh

>To many, the use of [_data_ and _media_] in their original plural form is a timus test for ltieracy, so it takes some bravery to deviate from the norm. But I think the words are now singular in most cases.
>
>_Data_ was a plural word when its singular form was still alive. When was the last time you saw _datum_ anywhere but in a discussion of the issue? The purists are trying to keep the singular form on lie support, but I say it's time to pull the plug and acknowledge that _data_ is a collective noun, like _information_.
>
>_Media_ is a plural when it refers to the plural of _medium_, but...usually it doesn't. When. an artist works in _mixed media_, that's a plural usage. Oil painting is a medium, collage art is a medium, sculpture is a medium.
>
>_The news media_ began as a similar plural term---it referred to print, radio and television. The plural usage still exists, with the online worlds as another medium, but usually when people refer to _the media_ (meaning the enws media), they're using it as a collective singular. That singular often overlaps with the print-radio-television-and-Internet plural that I described, but listen more closely and it's clear that those media are not what people have in mind. (Bill Walsh, _The Elephants of Style_)

I no longer hear gasps in the crowd when a well respected person says _data_ in that collective noun sense.

![data/datum ngram frequency in Google Books](https://github.com/chapmanbe/raw-stuff/blob/main/GoogleNgrams/data_datum.png?raw=true)

"""

# ╔═╡ 9c96a6c0-42aa-4985-84ad-0e7ccd4974a7
md"""

### Data in the news

I recently (7 September 2021) went to the [abc.com.au search site](https://search-beta.abc.net.au/index.html?siteTitle=news#/) and searched for `data`. Here are four health-related news stories that come up on the first page of the results:

- [NSW got 45 per cent of the Pfizer vaccines allocated to GPs last month, data shows](https://www.abc.net.au/news/2021-09-06/nsw-gps-got-45-per-cent-of-pfizer-covid-vaccines-last-month/100380908)
- [VIDEO: Queensland Premier accused of misrepresenting data on reopening](https://www.abc.net.au/news/2021-09-02/queensland-premier-accused-of-misrepresenting-data/13525132)
- [VIDEO: New data finds thousands of NSW healthcare staff unvaccinated](https://www.abc.net.au/news/2021-09-02/new-data-finds-thousands-of-healthcare-staff-unvaccinated/13523916)
- [Vaccination rates 'set to rise' in Mildura, as data highlights rocky start to rollout](https://www.abc.net.au/news/2021-08-31/vaccination-rates-expected-to-rise-in-mildura/100422418)

### Information in the news

- [VIDEO: Epidemiologist says authorities need to provide more information on how the virus is spreading](https://www.abc.net.au/news/2021-08-16/authorities-need-to-provide-more-info-on-how-virus-spreading/13497556)
- [Australia's official COVID-19 health information translations left to become eight weeks out of date](https://www.abc.net.au/news/2021-08-12/covid-19-information-weeks-out-of-date/100369794)
- [As Tasmania's homeless population receives coronavirus vaccines , there are calls for more accessible public health information](https://www.abc.net.au/news/2021-08-02/mobile-clinics-vaccinating-tasmanias-vulnerable-covid19/100340842)

### Knowledge in the news

Repeating the steps with knowledge, I had to go to the third page of search results to find a knowledge story related to health.

- [Local knowledge vital to contact tracing success in fight against coronavirus](https://www.abc.net.au/news/2020-08-15/local-contact-tracing-teams-needed-to-combat-coronavirus/12557504)
- [COVID-19 vaccine researchers draw on knowledge from history's 'huge disasters' and success stories](https://www.abc.net.au/news/2020-07-15/coronavirus-covid-19-vaccine-researchers-drawing-on-history/12448736)
- [How neuro-knowledge can help us find happiness and improve mental health](https://www.abc.net.au/news/2020-07-05/how-neuro-knowledge-can-help-us-find-happiness-coronavirus/12402152)

## Activity

Based on thise headlines (no need to read the full articles), how would you describe data, information, and knowledge?

$(@bind dik_news TextField((80,7)))

"""

# ╔═╡ d1ada150-cc7e-42fc-aaaa-fc9d7426e87e
let dik_news = md"""

Here are some of the things that I see in the usage.
	
First, _data_ is much more commonly used than either _information_ or _knowledge_. This is somewhat reflected in the Google Books ngram frequencies for the three words.
	
![Google N-gram frequencies for data, informationk, and knowledge](https://github.com/chapmanbe/raw-stuff/blob/main/GoogleNgrams/dik_ngrams.png?raw=true)
	
Second, look at how frequently _data_ seems to be an actor in the universe. _Data_ "shows" and "finds" and "highlights" seemingly without human help. By contrast _information_ and _knwoledge_ are passive.
"""
	
HTML("""<details><summary><strong>My Answers</strong></summary>$(html(dik_news))</details>""")

end

# ╔═╡ d37b4cfd-0745-4e41-8813-3752ab9db1f3
md"""
## Your definitions

Before I tell you how I'm going to define data, information, and knowledge, I'd like to gather your definitions. I don't want you opening a dictionary or going to wikipedia. Imamgine you are in a car going for a long drive when suddenly your four-year-old self appears in the back seat and asks, "Mom/Dad what's 'data'?" and the same for information and knowledge. Don't think too long; you might get in an accident, or worse you'll ask yourself again.

$(@bind dik_self TextField((80,7)))

#### Type your answers here.


"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.9"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "438d35d2d95ae2c5e8780b330592b6de8494e779"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.3"

[[PlutoUI]]
deps = ["Base64", "Dates", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "Suppressor"]
git-tree-sha1 = "44e225d5837e2a2345e69a1d1e01ac2443ff9fcb"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.9"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Suppressor]]
git-tree-sha1 = "a819d77f31f83e5792a76081eee1ea6342ab8787"
uuid = "fd094767-a336-5f1f-9728-57cf17d0bbfb"
version = "0.2.0"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╟─5a94afc0-0fc6-11ec-3c01-030a879b4c06
# ╟─9c96a6c0-42aa-4985-84ad-0e7ccd4974a7
# ╟─d1ada150-cc7e-42fc-aaaa-fc9d7426e87e
# ╟─d37b4cfd-0745-4e41-8813-3752ab9db1f3
# ╟─095703b0-294a-4dcf-be5f-79e4c64f956e
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
