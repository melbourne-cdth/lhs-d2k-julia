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

# ╔═╡ 78c5a32c-fef3-11eb-0560-6592672bbca5
using PlutoUI


# ╔═╡ 214bc212-39a2-44e1-8e7f-aa0bbe6e69df


# ╔═╡ 9d4a1119-bbbe-4d26-af88-6789420ab030
md"""# Data Collection as Abstraction

The word abstraction comes to us via the Latin verm _abstrahere_ meaining "to pull", "drag" or "draw away from" (_Information Ages_, p. 4)

>Abstraction: The action of considering something in the abstract, independently of its associations or attributes; the process of isolating properties or characteristics common to a number of diverse objects, events, etc., without reference to the peculiar properties of particular examples or instances. Also: the state of being considered in this way; abstractness. ([OED](oed.com/view/Entry/766?redirectedFrom=abstraction#eid))


-----------

>Generalization: The action or process of forming or expressing a general concept or proposition on the basis of inference from particular instances. ([OED](https://www.oed.com/view/Entry/77505?redirectedFrom=generalization#eid))


------------

>In most dictionaries, the term abstraction is defined as a quality, generality, and ideas. Dictionary source [7] defines abstraction as “the act of considering something as a general quality or characteristics, apart from concrete realities, specific objects or actual instances”. Abstraction is the process of initial concept formulation and generalization of ideas by extracting common qualities from specific examples. Other definitions of abstraction related to generality are “a general idea or quality rather than an actual person, object, or event: an abstract idea or quality” by [8], and “the quality of dealing with ideas rather than events” by [9]. __These definitions all summarize abstraction as the act of generalizing something by taking out only important points from the detailed characteristics of a problem.__ (doi:10.1016/j.procir.2016.01.038)


The challenge is that what constitutes __"only important points"__ is context dependent.
"""

# ╔═╡ 67199872-460d-4674-a8a2-24d19860aeda
md"""# Picasso's Bulls

On November 2, 1945 the Spanish artist Pablo Picasso started working in the lithography workshop of the Parisian Fernand Mourlot. For four months he feverishly worked on creating lithographics, an artistic form he had not worked with extensively in the past. The most famous product of these months is a series of lithographs of a bull. In the first four lithographs, the bull is getting more detailed, more "realistic." But starting with the 5th lithograph, each subsequent lithograph is more sparse, more "abstract" until in the last lithograph, Picasso only uses six (as I count them) lines to depict the bull. According to the art historian Irvine Lavine, Picasso's intent was to 

>to reduce the bull to its constituent parts, to recover the disjecta membra of his dream-bull—bred of pure lines to an elemental, disembodied, quintessential bullishness. ([PICASSO'S LITHOGRAPH(S) "THE BULL(S)" AND THE HISTORY OF ART IN REVERSE *](https://publications.ias.edu/sites/default/files/Lavin_PicassoBulls_2010.pdf))
"""

# ╔═╡ 2953b221-96c3-47ad-9292-49812c0939ad
html"""<img src="https://live.staticflickr.com/5613/31475770070_f678cf245c_b.jpg" width="1024" alt="Pasadena, Norton Simon Museum, Picasso P. The Bull, 1946">"""

# ╔═╡ ef1eb844-9796-4d43-9529-f2daf6bd07f5
md"""

### Question:

Based on your examination of Picasso's last lithograph, what would you say consistitues his

#### Type your answers here
$(@bind what_is_bullishness TextField((80,7)))
"""

# ╔═╡ 40e32ce3-8b9d-4ec9-af2b-8c4715b53556
let bullanswer = md"""

According to my interpretation of the lithograph, to Picasso the essence of a bull is 
	
1. Four legs
1. A tail
1. A large body
1. A pair of horns
1. A penis
1. A scrotum
	
The technology that Picasso chose to use would limit _what_ he could depict about the bull. The essence of a bull might be different if he was sculpting (3D) or painting (color).
"""
	
HTML("""<details><summary><strong>My Answers</strong></summary>$(html(bullanswer))</details>""")

end

# ╔═╡ 4b8ba289-3cbe-4113-9686-f02e5377de58
md""" ## Remember: 
### Abstraction is Context (and Technology) Dependent!

### Example

Here is what a bull might abstract to for a rancher.

__Bonus:__ Can anyone recognize a connection between the bull's name and his year of birth (YOB)?
"""

# ╔═╡ 0c1136e7-53ac-46f5-b58c-4c80da0dcc8b
html"""


<table border=1>
  <tr "text-align: left">
    <th>ID</th><th>Name</th><th>Species</th><th>Breed</th><th>Sex</th><th>Weight</th><th>YOB</th>
  </tr>
  <tr>
    <td>53287</td><td>Ferdinand</td><td>Bos taurus</td><td>Pajuna</td><td>M</td><td>583</td><td>1936</td>  </tr>
</table>

"""

# ╔═╡ 87104176-fb30-4542-977a-5551de189938
begin
bcomment = md"""### Final comment on our bull abstraction example

Our abstractions to date have essentially described a "bull" as existing alone in some universe. We have excluded everything about the environment which the bull lives in as well as the bull's society.
	
This is not a problem, as long as we recognize what we might call the __granularity__ of our model and the context for which that granuality was chosen.
"""
	
modelcomment= md"""
		
>However, to build a model we need to choose a level of granularity and try to stay within it, or the whole model would evaporate into the nothingness of truth. Any level of granularity is called a _stereotype_; e.g., we stereotype objects on earth by saying they each have a weight. A stereotype is a lie, more politely a conceptual simplification, that is convenient for the way we want to do business. (Spivak, David I. _Category Theory for the Sciences_ (p. 45). MIT Press.)

"""

HTML("""$(html(bcomment))
<table>
<tr>
<th>A Bull's Environment</th><th>A Bull's Social Context</th>
</tr>
<tr>
<td><img width="384" alt="Spanish bull (13541113244)" src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Spanish_bull_%2813541113244%29.jpg/512px-Spanish_bull_%2813541113244%29.jpg"></td>
<td><img width="384" alt="Taurus cattle Lippeaue2" src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Taurus_cattle_Lippeaue2.JPG/512px-Taurus_cattle_Lippeaue2.JPG">
</td>
</tr>
</table>
$(html(modelcomment))""")

end
		

# ╔═╡ b54a636b-e3aa-4012-8e94-a7248e4392fe
md"""
## More Utilitarian Abstraction
### Maps as Data Abstraction


Common examples of data abstractions are maps. What makes a map more useful than, say, a satellite image of the same region?

### __Example:__ Washington D.C. Metro Map


![DC Metrorail Map](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Wash-dc-metro-map.png/420px-Wash-dc-metro-map.png)

#### Questions:

1. What are some of the abstractions that you think are in this map? (You might want to use Google Maps or some other map resource to look at the DC region.)
1. Why do you think thees abstractions were made?
#### Type your answers here
$(@bind resp1 TextField((80,7)))
"""

# ╔═╡ dc07f793-b2ad-4180-814c-b143382a47f5

let mapanswer = md"""
## What is not included in the model?

The map/model gives up absolute distance and to a lesser degree direction in order to simplify the representation of the _ordinal_ location of stop and needs and opportiunities for train transfers. 
	
#### Distance
	
Limiting ourselves to the redline with a starting point of Metro Central, the Metro map indicates that the Tenleytown-AU stop is roughly have way between Metro Central and the Rockville stop. However, from the Google Map you now see, it looks like the Rockville station is at least 4x farther.
	
#### Direction
	
Again on the red line, we see that Rockville is located significantly west of Glenmont. However, from the Google Map we see that Rockville is located north north-west of Glenmont.
	
### How does the abstraction help its purpose?
	
- Imagine the difficulty of differentiating all the metro stations in the inner-city region while still identicating the location of the suburban stations.
- You could not use this map to:
	- Estimate driving time between ...
	- ???
"""
	
HTML("""<details><summary><strong>My Answers</strong></summary><iframe src="https://widgets.figshare.com/articles/16557987/embed?show_title=0" width="384" height="237"  frameborder="0"></iframe>$(html(mapanswer))</details>""")

end


# ╔═╡ fb8e8f2e-ecc0-46d8-bc79-b3ed773040b2
md"""
## Abstracting a Patient

When we generate and collect data on a patient, we are following the same steps the map maker is taking. We are ignoring some features about the patient and emphasizing (distorting?) others in order to make a map (abstraction) of that patient that helps us make decisions/take actions regarding that patient more efficiently---within our domain! 

## Focusing on our use case

The use-case for this short coure is centered on the the management of type II diabetes patients in a GP clinic. In this context, what do you think the essence of a person is in this context?

What are significant features that a person might feel are essential in their definition of their selfness that would likely not be included in the GP clinic abstraction of them

#### Type your answers here
$(@bind gp_abstraction TextField((80,7)))
"""

# ╔═╡ 0f62a4eb-3f72-4cab-b966-5b6847a118e1
let f_abs = md"""

- [What is up with the spherical cow?](https://www.wired.com/2011/02/what-is-up-with-the-spherical-cow/)
  - The physical world is _very_ complex and so physicists are always simplifying it. This simplification can sometimes be taken to extremes, leading to this very common physics joke.
- The durrells Series 1 Episode 3 filing people by height.
  - This British show is currently (September 2021) [streaming on ABC iView](https://iview.abc.net.au/video/ZW2693A003S00). In this episde the daughter, Margo, gets a job at a surgery where she proceeds to file patient records by patient height as this was the first data element on the forms and thus, presumably most important feature.
- [From A to Z — the surprising history of alphabetical order](https://www.abc.net.au/news/2020-06-11/history-of-alphabetical-order-a-to-z/12320808)
  - The variety of ways we can abstract knowledge relationships

	
"""
	
HTML("""<h2> Further Resources on Abstraction</h2>

<a title="Ingrid Kallick (http://www.ikallick.com), Public domain, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:SphericalCow2.gif"><img width="128" alt="SphericalCow2" src="https://upload.wikimedia.org/wikipedia/commons/2/23/SphericalCow2.gif"></a>
	
$(html(f_abs))
""")
end

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
# ╟─214bc212-39a2-44e1-8e7f-aa0bbe6e69df
# ╟─9d4a1119-bbbe-4d26-af88-6789420ab030
# ╟─67199872-460d-4674-a8a2-24d19860aeda
# ╟─2953b221-96c3-47ad-9292-49812c0939ad
# ╟─ef1eb844-9796-4d43-9529-f2daf6bd07f5
# ╟─40e32ce3-8b9d-4ec9-af2b-8c4715b53556
# ╟─4b8ba289-3cbe-4113-9686-f02e5377de58
# ╟─0c1136e7-53ac-46f5-b58c-4c80da0dcc8b
# ╟─87104176-fb30-4542-977a-5551de189938
# ╟─b54a636b-e3aa-4012-8e94-a7248e4392fe
# ╟─dc07f793-b2ad-4180-814c-b143382a47f5
# ╟─fb8e8f2e-ecc0-46d8-bc79-b3ed773040b2
# ╟─0f62a4eb-3f72-4cab-b966-5b6847a118e1
# ╟─78c5a32c-fef3-11eb-0560-6592672bbca5
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
