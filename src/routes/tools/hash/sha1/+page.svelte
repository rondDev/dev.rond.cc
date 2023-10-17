<script lang="ts">
	import { Label, Textarea } from 'flowbite-svelte';
	import sha1 from 'js-sha1';
	import { slide } from 'svelte/transition';

	let input: string = '';
	let output: string = '';

	function sha1Helper() {
		output = sha1(input);
	}
</script>

<div
	class="w-2/3 flex flex-col"
	in:slide={{ duration: 300, delay: 300 }}
	out:slide={{ duration: 300 }}
>
	<h1 class="text-[40px] mt-8 self-center">SHA1</h1>
	<div
		class="flex flex-col gap-10 grow justify-center"
		in:slide={{ duration: 300, delay: 300 }}
		out:slide={{ duration: 300 }}
	>
		<div>
			<Label for="textarea-id" class="mb-2">Input</Label>
			<Textarea
				id="textarea-id"
				placeholder="Your text here"
				rows="4"
				name="message"
				class="resize-none"
				bind:value={input}
				on:keyup={sha1Helper}
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
	</div>
</div>
