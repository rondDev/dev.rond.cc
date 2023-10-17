<script lang="ts">
	import { Label, Textarea } from 'flowbite-svelte';
	import jwtDecode from 'jwt-decode';
	import { slide } from 'svelte/transition';

	let input: string = '';
	let output: string = '';

	function jwtHelper() {
		output = jwtDecode(input);
	}
</script>

<div
	class="w-2/3 flex flex-col"
	in:slide={{ duration: 300, delay: 300 }}
	out:slide={{ duration: 300 }}
>
	<h1 class="text-[40px] mt-8 self-center">JWT</h1>
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
				on:keyup={jwtHelper}
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
