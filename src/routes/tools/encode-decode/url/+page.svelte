<script lang="ts">
	import { Label, Textarea, Toggle } from 'flowbite-svelte';
	import { slide } from 'svelte/transition';

	let input: string = '';
	let output: string = '';

	let decode = false;

	function urlHelper() {
		if (decode) {
			output = decodeURI(input);
		} else {
			output = encodeURI(input);
		}
	}

	function flipInOut() {
		[input, output] = [output, input];
	}
</script>

<div
	class="w-2/3 flex flex-col"
	in:slide={{ duration: 300, delay: 300 }}
	out:slide={{ duration: 300 }}
>
	<h1 class="text-[40px] mt-8 self-center">URL</h1>
	<div class="flex flex-col gap-10 grow justify-center">
		<div>
			<Label for="textarea-id" class="mb-2">Input</Label>
			<Textarea
				id="textarea-id"
				placeholder="Your text here"
				rows="4"
				name="message"
				class="resize-none"
				bind:value={input}
				on:keyup={urlHelper}
			/>
		</div>
		<div>
			<Label for="textarea-id" class="mb-2">Output</Label>
			<Textarea
				id="textarea-id"
				placeholder="Your text here"
				rows="4"
				name="message"
				class="resize-none"
				bind:value={output}
			/>
		</div>
		<Toggle bind:checked={decode} on:change={flipInOut}>Decode</Toggle>
	</div>
</div>
