// RUN: llvm-mc -triple amdgcn--amdhsa -mcpu=kaveri -show-encoding %s | FileCheck %s --check-prefix=ASM
// RUN: llvm-mc -filetype=obj -triple amdgcn--amdhsa -mcpu=kaveri -show-encoding %s | llvm-readobj -s -sd | FileCheck %s --check-prefix=ELF

// ELF: SHT_NOTE
// ELF: 0000: 04000000 08000000 01000000 414D4400
// ELF: 0010: 01000000 00000000 04000000 1B000000
// ELF: 0020: 03000000 414D4400 04000700 07000000
// ELF: 0030: 00000000 00000000 414D4400 414D4447
// ELF: 0040: 50550000

.hsa_code_object_version 1,0
// ASM: .hsa_code_object_version 1,0

.hsa_code_object_isa 7,0,0,"AMD","AMDGPU"
// ASM: .hsa_code_object_isa 7,0,0,"AMD","AMDGPU"

.text
amd_kernel_code_t_test_all:
; Test all amd_kernel_code_t members with non-default values.
.amd_kernel_code_t
	kernel_code_version_major = 100
	kernel_code_version_minor = 100
	machine_kind = 0
	machine_version_major = 5
	machine_version_minor = 5
	machine_version_stepping = 5
	kernel_code_entry_byte_offset = 512
	kernel_code_prefetch_byte_size = 1
	max_scratch_backing_memory_byte_size = 1
	compute_pgm_rsrc1_vgprs = 1
	compute_pgm_rsrc1_sgprs = 1
	compute_pgm_rsrc1_priority = 1
	compute_pgm_rsrc1_float_mode = 1
	compute_pgm_rsrc1_priv = 1
	compute_pgm_rsrc1_dx10_clamp = 1
	compute_pgm_rsrc1_debug_mode = 1
	compute_pgm_rsrc1_ieee_mode = 1
	compute_pgm_rsrc2_scratch_en = 1
	compute_pgm_rsrc2_user_sgpr = 1
	compute_pgm_rsrc2_tgid_x_en = 1
	compute_pgm_rsrc2_tgid_y_en = 1
	compute_pgm_rsrc2_tgid_z_en = 1
	compute_pgm_rsrc2_tg_size_en = 1
	compute_pgm_rsrc2_tidig_comp_cnt = 1
	compute_pgm_rsrc2_excp_en_msb = 1
	compute_pgm_rsrc2_lds_size = 1
	compute_pgm_rsrc2_excp_en = 1
	enable_sgpr_private_segment_buffer = 1
	enable_sgpr_dispatch_ptr = 1
	enable_sgpr_queue_ptr = 1
	enable_sgpr_kernarg_segment_ptr = 1
	enable_sgpr_dispatch_id = 1
	enable_sgpr_flat_scratch_init = 1
	enable_sgpr_private_segment_size = 1
	enable_sgpr_grid_workgroup_count_x = 1
	enable_sgpr_grid_workgroup_count_y = 1
	enable_sgpr_grid_workgroup_count_z = 1
	enable_ordered_append_gds = 1
	private_element_size = 1
	is_ptr64 = 1
	is_dynamic_callstack = 1
	is_debug_enabled = 1
	is_xnack_enabled = 1
	workitem_private_segment_byte_size = 1
	workgroup_group_segment_byte_size = 1
	gds_segment_byte_size = 1
	kernarg_segment_byte_size = 1
	workgroup_fbarrier_count = 1
	wavefront_sgpr_count = 1
	workitem_vgpr_count = 1
	reserved_vgpr_first = 1
	reserved_vgpr_count = 1
	reserved_sgpr_first = 1
	reserved_sgpr_count = 1
	debug_wavefront_private_segment_offset_sgpr = 1
	debug_private_segment_buffer_sgpr = 1
	kernarg_segment_alignment = 5
	group_segment_alignment = 5
	private_segment_alignment = 5
	wavefront_size = 5
	call_convention = 1
	runtime_loader_kernel_symbol = 1
.end_amd_kernel_code_t

// ASM-LABEL: {{^}}amd_kernel_code_t_test_all:
// ASM: .amd_kernel_code_t
// ASM: kernel_code_version_major = 100
// ASM: kernel_code_version_minor = 100
// ASM: machine_kind = 0
// ASM: machine_version_major = 5
// ASM: machine_version_minor = 5
// ASM: machine_version_stepping = 5
// ASM: kernel_code_entry_byte_offset = 512
// ASM: kernel_code_prefetch_byte_size = 1
// ASM: max_scratch_backing_memory_byte_size = 1
// ASM: compute_pgm_rsrc1_vgprs = 1
// ASM: compute_pgm_rsrc1_sgprs = 1
// ASM: compute_pgm_rsrc1_priority = 1
// ASM: compute_pgm_rsrc1_float_mode = 1 
// ASM: compute_pgm_rsrc1_priv = 1
// ASM: compute_pgm_rsrc1_dx10_clamp = 1
// ASM: compute_pgm_rsrc1_debug_mode = 1 
// ASM: compute_pgm_rsrc1_ieee_mode = 1
// ASM: compute_pgm_rsrc2_scratch_en = 1
// ASM: compute_pgm_rsrc2_user_sgpr = 1
// ASM: compute_pgm_rsrc2_tgid_x_en = 1
// ASM: compute_pgm_rsrc2_tgid_y_en = 1
// ASM: compute_pgm_rsrc2_tgid_z_en = 1
// ASM: compute_pgm_rsrc2_tg_size_en = 1
// ASM: compute_pgm_rsrc2_tidig_comp_cnt = 1
// ASM: compute_pgm_rsrc2_excp_en_msb = 1
// ASM: compute_pgm_rsrc2_lds_size = 1
// ASM: compute_pgm_rsrc2_excp_en = 1
// ASM: enable_sgpr_private_segment_buffer = 1
// ASM: enable_sgpr_dispatch_ptr = 1
// ASM: enable_sgpr_queue_ptr = 1
// ASM: enable_sgpr_kernarg_segment_ptr = 1
// ASM: enable_sgpr_dispatch_id = 1
// ASM: enable_sgpr_flat_scratch_init = 1
// ASM: enable_sgpr_private_segment_size = 1
// ASM: enable_sgpr_grid_workgroup_count_x = 1
// ASM: enable_sgpr_grid_workgroup_count_y = 1
// ASM: enable_sgpr_grid_workgroup_count_z = 1
// ASM: enable_ordered_append_gds = 1
// ASM: private_element_size = 1
// ASM: is_ptr64 = 1
// ASM: is_dynamic_callstack = 1
// ASM: is_debug_enabled = 1
// ASM: is_xnack_enabled = 1
// ASM: workitem_private_segment_byte_size = 1
// ASM: workgroup_group_segment_byte_size = 1
// ASM: gds_segment_byte_size = 1
// ASM: kernarg_segment_byte_size = 1
// ASM: workgroup_fbarrier_count = 1
// ASM: wavefront_sgpr_count = 1
// ASM: workitem_vgpr_count = 1
// ASM: reserved_vgpr_first = 1
// ASM: reserved_vgpr_count = 1
// ASM: reserved_sgpr_first = 1
// ASM: reserved_sgpr_count = 1
// ASM: debug_wavefront_private_segment_offset_sgpr = 1
// ASM: debug_private_segment_buffer_sgpr = 1
// ASM: kernarg_segment_alignment = 5
// ASM: group_segment_alignment = 5
// ASM: private_segment_alignment = 5
// ASM: wavefront_size = 5
// ASM: call_convention = 1
// ASM: runtime_loader_kernel_symbol = 1
// ASM: .end_amd_kernel_code_t

amd_kernel_code_t_minimal:
.amd_kernel_code_t
	enable_sgpr_kernarg_segment_ptr = 1
	is_ptr64 = 1
	compute_pgm_rsrc1_vgprs = 1
	compute_pgm_rsrc1_sgprs = 1
	compute_pgm_rsrc2_user_sgpr = 2
	kernarg_segment_byte_size = 16
	wavefront_sgpr_count = 8
//      wavefront_sgpr_count = 7
;	wavefront_sgpr_count = 7
// Make sure a blank line won't break anything:

// Make sure a line with whitespace won't break anything:
   
	workitem_vgpr_count = 16
.end_amd_kernel_code_t

// ASM-LABEL: {{^}}amd_kernel_code_t_minimal:
// ASM: .amd_kernel_code_t
// ASM:	kernel_code_version_major = 1
// ASM:	kernel_code_version_minor = 0
// ASM:	machine_kind = 1
// ASM:	machine_version_major = 7
// ASM:	machine_version_minor = 0
// ASM:	machine_version_stepping = 0
// ASM:	kernel_code_entry_byte_offset = 256
// ASM:	kernel_code_prefetch_byte_size = 0
// ASM:	max_scratch_backing_memory_byte_size = 0
// ASM:	compute_pgm_rsrc1_vgprs = 1
// ASM:	compute_pgm_rsrc1_sgprs = 1
// ASM:	compute_pgm_rsrc1_priority = 0
// ASM:	compute_pgm_rsrc1_float_mode = 0
// ASM:	compute_pgm_rsrc1_priv = 0
// ASM:	compute_pgm_rsrc1_dx10_clamp = 0
// ASM:	compute_pgm_rsrc1_debug_mode = 0
// ASM:	compute_pgm_rsrc1_ieee_mode = 0
// ASM:	compute_pgm_rsrc2_scratch_en = 0
// ASM:	compute_pgm_rsrc2_user_sgpr = 2
// ASM:	compute_pgm_rsrc2_tgid_x_en = 0
// ASM:	compute_pgm_rsrc2_tgid_y_en = 0
// ASM:	compute_pgm_rsrc2_tgid_z_en = 0
// ASM:	compute_pgm_rsrc2_tg_size_en = 0
// ASM:	compute_pgm_rsrc2_tidig_comp_cnt = 0
// ASM:	compute_pgm_rsrc2_excp_en_msb = 0
// ASM:	compute_pgm_rsrc2_lds_size = 0
// ASM:	compute_pgm_rsrc2_excp_en = 0
// ASM:	enable_sgpr_private_segment_buffer = 0
// ASM:	enable_sgpr_dispatch_ptr = 0
// ASM:	enable_sgpr_queue_ptr = 0
// ASM:	enable_sgpr_kernarg_segment_ptr = 1
// ASM:	enable_sgpr_dispatch_id = 0
// ASM:	enable_sgpr_flat_scratch_init = 0
// ASM:	enable_sgpr_private_segment_size = 0
// ASM:	enable_sgpr_grid_workgroup_count_x = 0
// ASM:	enable_sgpr_grid_workgroup_count_y = 0
// ASM:	enable_sgpr_grid_workgroup_count_z = 0
// ASM:	enable_ordered_append_gds = 0
// ASM:	private_element_size = 0
// ASM:	is_ptr64 = 1
// ASM:	is_dynamic_callstack = 0
// ASM:	is_debug_enabled = 0
// ASM:	is_xnack_enabled = 0
// ASM:	workitem_private_segment_byte_size = 0
// ASM:	workgroup_group_segment_byte_size = 0
// ASM:	gds_segment_byte_size = 0
// ASM:	kernarg_segment_byte_size = 16
// ASM:	workgroup_fbarrier_count = 0
// ASM:	wavefront_sgpr_count = 8
// ASM:	workitem_vgpr_count = 16
// ASM:	reserved_vgpr_first = 0
// ASM:	reserved_vgpr_count = 0
// ASM:	reserved_sgpr_first = 0
// ASM:	reserved_sgpr_count = 0
// ASM:	debug_wavefront_private_segment_offset_sgpr = 0
// ASM:	debug_private_segment_buffer_sgpr = 0
// ASM:	kernarg_segment_alignment = 4
// ASM:	group_segment_alignment = 4
// ASM:	private_segment_alignment = 4
// ASM:	wavefront_size = 6
// ASM:	call_convention = 0
// ASM:	runtime_loader_kernel_symbol = 0
// ASM: .end_amd_kernel_code_t
