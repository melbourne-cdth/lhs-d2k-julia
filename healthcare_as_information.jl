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

# ╔═╡ 69aafbda-f938-4358-97d9-87bf1cc3e82a
begin
    using ShortCodes
	using PlutoUI
end

# ╔═╡ 56531782-09f2-11ec-110b-551c2e199804
md"""
## Medicine is a Data-Intensive Discipline

I think one of the things that's really important for medical students to know is that all of the information that's generated around patients around patient care---getting lab tests, imaging tests, your notes when you see a patient---all of that ends up getting stored in some kind of data warehouse. And to have that information be useful to you in your next encounter, how that information is stored and how it gets extracted is really really important.

This is one of the pushes for data standards.  If i say a patient name is Joe Smith and you say a patient name is Joe Smith and someone else says a patient name is Joe Smith, if every one of our data systems stores first name and last name in a different way and it's the same Joe Smith, we're not going to be able to talk to each other about that patient very well. So I think medical students really need to understand that how data is stored is going to have an influence on their ability to extract that to take care of patients in the future.

So even asking questions about how does it work? why does it work? where does it go? what's the data structure? [is important].

[It is important to know] that it's a human that we're taking care of, __but as doctors we're generating data and patients are generating data__ and
that's really something that I think
medical students need to know. (Marta Heilbrun, MD, Vice Chair for Quality, Department of Radiology, Emory University)"""

# ╔═╡ b204a8a8-6125-4d9a-95bd-3db835edf818
md"""Below is the clip from Dr. Heilbrun, as well as other physicians about what every medical student should know about informatics."""

# ╔═╡ 76637834-8b1a-4ce0-ab61-4a3bbe16aa48
html"""
<iframe width="560" height="315" src="https://www.youtube.com/embed/652RmFCvV-w?start=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
"""

# ╔═╡ 6af9a717-439d-4129-8014-f832bc289131
YouTube("652RmFCvV-w", 1, 120)

# ╔═╡ 7eaf4347-8e6b-46c0-aa64-5790d0fd77c1
html"""<div data-video = "VIDEO_ID"
         data-startseconds = "100"
         data-endseconds = "200"
         data-height = "480"
         data-width = "640"
         id = "youtube-player">
    </div>

    <script src="https://www.youtube.com/iframe_api"></script>
    <script type="text/javascript">
      function onYouTubeIframeAPIReady() {
        var ctrlq = document.getElementById("youtube-player");
        var player = new YT.Player('youtube-player', {
          height: ctrlq.dataset.height,
          width: ctrlq.dataset.width,
          events: {
            'onReady': function(e) {
              e.target.cueVideoById({
                videoId: ctrlq.dataset.video,
                startSeconds: ctrlq.dataset.startseconds,
                endSeconds: ctrlq.dataset.endseconds
              });
            }
          }
        });
      }
    </script>
"""

# ╔═╡ 027774d5-9034-4870-a5e4-aff73e381075
md"""
## But what is "data"?

- Data as singular vs plural and academic snobbery


We are going to follow what is known as the __The Diaphoric Definition of Data (DDD):__

> A datum is a putative fact regarding some difference or lack of uniformity within some context. ([Floridi, Luciano, "Semantic Conceptions of Information"](https://plato.stanford.edu/entries/information-semantic/))


In the David Nicholls case study there are a number of physical data that are collected.

For example, an ECG is a measurement of a __difference__ in __electrical voltage__ on different locations on the skin at different points of time.

### What are some other examples of physical data that are generated/colleced in this case?

#### Type your answers here
$(@bind physicaldata1 TextField((80,7)))

"""

# ╔═╡ f8e829ea-5ff9-4203-a7ae-9a9e7a6646c0
let answer1 = md"""

- Blood pressure: Systolic and diastolic blood pressures are differences in pressure at different points of time.
- Respiration: 
"""
	
HTML("<details><summary><strong>My Answers</strong></summary>$(html(answer1))</details>")
    end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
ShortCodes = "f62ebe17-55c5-4640-972f-b59c0dd11ccf"

[compat]
PlutoUI = "~0.7.9"
ShortCodes = "~0.3.2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "ded953804d019afa9a3f98981d99b33e3db7b6da"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "44e3b40da000eab4ccb1aecdc4801c040026aeb5"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.13"

[[IniFile]]
deps = ["Test"]
git-tree-sha1 = "098e4d2c533924c921f9f9847274f2ad89e018b8"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.0"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[JSON3]]
deps = ["Dates", "Mmap", "Parsers", "StructTypes", "UUIDs"]
git-tree-sha1 = "b3e5984da3c6c95bcf6931760387ff2e64f508f3"
uuid = "0f8b85d8-7281-11e9-16c2-39a750bddbf1"
version = "1.9.1"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "0fb723cd8c45858c22169b2e42269e53271a6df7"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.7"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "Random", "Sockets"]
git-tree-sha1 = "1c38e51c3d08ef2278062ebceade0e46cefc96fe"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.0.3"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Memoize]]
deps = ["MacroTools"]
git-tree-sha1 = "2b1dfcba103de714d31c033b5dacc2e4a12c7caa"
uuid = "c03570c3-d221-55d1-a50c-7939bbd78826"
version = "0.4.4"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

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

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[ShortCodes]]
deps = ["Base64", "CodecZlib", "HTTP", "JSON3", "Memoize", "UUIDs"]
git-tree-sha1 = "866962b3cc79ad3fee73f67408c649498bad1ac0"
uuid = "f62ebe17-55c5-4640-972f-b59c0dd11ccf"
version = "0.3.2"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[StructTypes]]
deps = ["Dates", "UUIDs"]
git-tree-sha1 = "8445bf99a36d703a09c601f9a57e2f83000ef2ae"
uuid = "856f2bd8-1eba-4b0a-8007-ebc267875bd4"
version = "1.7.3"

[[Suppressor]]
git-tree-sha1 = "a819d77f31f83e5792a76081eee1ea6342ab8787"
uuid = "fd094767-a336-5f1f-9728-57cf17d0bbfb"
version = "0.2.0"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "216b95ea110b5972db65aa90f88d8d89dcb8851c"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.6"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
"""

# ╔═╡ Cell order:
# ╟─56531782-09f2-11ec-110b-551c2e199804
# ╟─b204a8a8-6125-4d9a-95bd-3db835edf818
# ╟─76637834-8b1a-4ce0-ab61-4a3bbe16aa48
# ╠═6af9a717-439d-4129-8014-f832bc289131
# ╠═7eaf4347-8e6b-46c0-aa64-5790d0fd77c1
# ╠═027774d5-9034-4870-a5e4-aff73e381075
# ╠═f8e829ea-5ff9-4203-a7ae-9a9e7a6646c0
# ╠═69aafbda-f938-4358-97d9-87bf1cc3e82a
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
